class HostsController < ApplicationController
=begin  
  # GET /hosts
  # GET /hosts.xml
  def index
    @hosts = Host.search(params[:filter])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hosts }
    end
  end
=end

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
    @hosts = Host.search(params)
    puts "Hosts #{@hosts}"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @host }
    end
  end
  
end
