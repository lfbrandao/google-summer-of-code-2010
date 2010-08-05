class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
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
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = get_user_based_on_role
    puts "@user #{@user}"
  end

  def edit
    @user = get_user_based_on_role
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
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
      format.html { redirect_to(account_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_user_based_on_role
    if can? :manage_users, @current_user and not params[:id].blank?
      return User.find(params[:id])
    else
      return @current_user
    end
  end
end
