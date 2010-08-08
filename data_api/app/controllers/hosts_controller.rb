class HostsController < ApplicationController
  before_filter :authenticate
  
  # GET /hosts/filter.xml?uri=uri1,uri2
  def filter
    if not params[:uri].nil? and not params[:uri].empty?
        @hosts = Host.filter(params[:uri])

        respond_to do |format|
          format.xml  { render :xml => @hosts.to_xml(:root => "hosts")}
        end
    else
      render :text => "Please submit a list of URIs."
    end
  end
end
