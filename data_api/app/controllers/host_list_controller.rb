class HostListController < ApplicationController
  def all_hosts
    @all_hosts = Host.get_all_websites
    #logger.debug #{@all_hosts.class()}
    respond_to do |format| 
      format.html # index.html.erb 
      format.xml { render :xml => @all_hosts }
    end
  end

  def index 
    @all_hosts = Website.get_all_websites
  end
  
  
end
