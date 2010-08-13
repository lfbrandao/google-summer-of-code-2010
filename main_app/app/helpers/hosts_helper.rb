module HostsHelper
  def get_url_variations(uri)
    uri = uri.downcase
    uri_variations = Array[uri]
    
    if uri.starts_with? 'http://www.' or url.starts_with? 'https://www.'
      uri_temp = uri.gsub('https://www.', 'https://')
      uri_temp = uri_temp.gsub('http://www.', 'http://')
      variations << uri_temp
    else
      uri_temp = uri.gsub('https://', 'https://www.')
      uri_temp = uri_temp.gsub('http://', 'http://www.')
      variations << uri_temp
    end  
    
    if uri.ends_with? '/'
      variations << uri.chop
      variations << uri_temp.chop
    else
      variations << uri.chop + '/'
      variations << uri_temp.chop + '/'
    end
    uri_variations = Array[uri]
  end
  
  def get_url_key(url_variations_list)
    return uri_variations.first
  end
end
