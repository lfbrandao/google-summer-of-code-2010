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
        def rest_query(host_address, params) 
          require 'uri'
          uri = URI.parse(host_address)
          http_get(uri.host, uri.path , uri.port, params)
        end
        
        def http_get(domain, path, port, params)
          puts "params #{params}"
          require 'net/http'
          puts Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.reverse.join('&')),port) if not params.nil?
          return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.reverse.join('&')),port) if not params.nil?
          return Net::HTTP.get(domain, path, port)
        end
      end

      module InstanceMethods
        # Add instance methods here
      end
    end
  end
end

