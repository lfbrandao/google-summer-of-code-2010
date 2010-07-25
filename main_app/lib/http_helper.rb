require 'net/http'
require 'cgi'

module HttpHelper
  def self.append_features(base) # :nodoc:
      super
      base.extend ClassMethods
    end
  
  module ClassMethods
    def http_get(domain,path,params)
      return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.reverse.join('&'))) if not params.nil?
      return Net::HTTP.get(domain, path)
    end
  end
end  
