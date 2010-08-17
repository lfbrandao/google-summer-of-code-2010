# RESTConnector
#Based on: http://juixe.com/techknow/index.php/2006/06/18/rails-plugin-tutorial/

module Berkman
  module Acts #:nodoc:
    module RESTConnector #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_restconnector
          include Berkman::Acts::RESTConnector::InstanceMethods
          extend Berkman::Acts::RESTConnector::SingletonMethods
        end
      end

      module SingletonMethods
        # Add class methods here
        def rest_query(host_address, params, username, password) 
          require 'uri'
          uri = URI.parse(host_address)
          http_get(uri.host, uri.path, uri.port, params, username, password)
        end
        
        def http_get(domain, path, port, params, username, password)
          require 'net/http'
          http = Net::HTTP.new(domain, port)
          http.open_timeout = 100 # in seconds
          http.read_timeout = 100 # in seconds
          
          if not params.nil?
            request = Net::HTTP::Get.new("#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.reverse.join('&')))
          else
            request = Net::HTTP.get(domain, path, port)
          end
          
          request.basic_auth(username, password)
          
          response = http.request(request)
          return response.body
        end
      end

      module InstanceMethods
        # Add instance methods here
      end
    end
  end
end

