# RESTConnector
#Based on: http://juixe.com/techknow/index.php/2006/06/18/rails-plugin-tutorial/

module Berkman
  module Acts #:nodoc:
    module RESTConnector #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_databaseconnector
          include Berkman::Acts::RESTConnector::InstanceMethods
          extend Berkman::Acts::RESTConnector::SingletonMethods
        end
      end

      module SingletonMethods
        # Add class methods here
        def rest_query(host_address) 
          require 'open-uri'
          require "rexml/document"

          hosts = Array.new
          puts host_address
          response = open(host_address).read
          puts response
          # to-do - validation? schema,dtd

          #read xml
          doc, hosts = REXML::Document.new(response), []
          doc.elements.each('hosts/host') do |element|
            id = element.elements['id'].text
            url = element.elements['url'].text
            hosts.push([id, url, id, url])
          end
          puts hosts.inspect
          hosts
        end
      end

      module InstanceMethods
        # Add instance methods here
      end
    end
  end
end

