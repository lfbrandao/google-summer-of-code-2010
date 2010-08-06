class HostsController < ApplicationController
  # GET /hosts/1
  # GET /hosts/1.xml
  def show

    @host = Host.find(params[:uri])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @host }
    end
  end
  
  def search
    if not params[:uri].nil?
      @hosts = Host.search(params)
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @host }
      end  
    end
  end
end