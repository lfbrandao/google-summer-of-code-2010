class HostsController < ApplicationController
  # GET /hosts/index
  # GET /hosts/index.xml
  def index
    @hosts = Host.index
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hosts.to_xml(:root => "hosts")}
      format.json  { render :json => @hosts.to_json}
    end
  end

  # GET /hosts/find
  # GET /hosts/find.xml
  def filter
    puts "params[:url] #{params[:uri]}"
    @hosts = Host.filter(params[:uri])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hosts.to_xml(:root => "hosts")}
      format.json  { render :json => @hosts.to_json}
    end
  end
end
