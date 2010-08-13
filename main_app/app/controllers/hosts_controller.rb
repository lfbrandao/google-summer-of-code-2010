class HostsController < ApplicationController
  helper :hosts
  
  def search
    if not params[:uri].nil?
      temp_params = Array.new
      original_params = params[:uri]
      
      if not validate_uris(params[:uri])
        flash[:notice] = "Invalid URI(s). Please check if all the URI(s) have the format http(s)://www.name.domain"
        return
      else
        params[:uri] = get_url_variations(original_params).join(",")
        @hosts = Host.search(params)
        params[:uri] = original_params

        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @host }
        end
      end
    end
  end
  
  
  private
  
  def validate_uris(uris)
    uri_array = uris.gsub(" ", "").split(",")
    reg = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/
    
    uri_array.each do |uri|
      if not reg.match(uri) 
        return false
      end
    end
    return true
  end
  
  def get_url_variations(uris)
    uri_array = uris.gsub(" ", "").split(",")
    uri_variations = Array[uris]
    
    uri_array.each do |uri|
      uri = uri.downcase
    
      if uri.starts_with? "http://www." or uri.starts_with? "https://www."
        uri_temp = uri.gsub("https://www.", "https://")
        uri_temp = uri_temp.gsub("http://www.", "http://")
        uri_variations << uri_temp
      else
        uri_temp = uri.gsub("https://", "https://www.")
        uri_temp = uri_temp.gsub("http://", "http://www.")
        uri_variations << uri_temp
      end  
    
      if uri.ends_with? "/"
        uri_variations << uri.chop
        uri_variations << uri_temp.chop
      else
        uri_variations << uri + "/"
        uri_variations << uri_temp + "/"
      end
    end
    
    uri_variations
  end
end