class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.role_ids.empty? 
      @user.role_ids = Array.[](Role.find_by_name("Subscriber").id)
    end
    
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to root_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = get_user_based_on_role
  end

  def edit
    @user = get_user_based_on_role
  end
  
  def update
    userid = User.find(params[:id]).id
    puts "USER ID #{userid}"
    @user = get_user_based_on_role
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to users_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    @user = get_user_based_on_role
    authorize! :manage, @user
    
    if @user != @current_user
      @user.destroy
      flash[:notice] = "Account deleted!"
    else
      flash[:notice] = "Cannot delete your own account!"
    end
    
    @user = @current_user
    
    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_user_based_on_role
    puts "can manage users - #{can? :manage_users, @current_user}"
    if can? :manage_users, @current_user and not params[:id].blank?
      u = User.find(params[:id])
      puts "OK #{u.id} #{@current_user.id}"
      return User.find(params[:id])
    else
      puts "User - #{@current_user}"
      return @current_user
    end
  end
end
