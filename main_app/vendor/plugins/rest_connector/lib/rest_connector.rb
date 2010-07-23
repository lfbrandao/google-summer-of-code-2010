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
  
          #hosts = Array.new
          #puts host_address
          open(host_address).read
          #puts response
          # to-do - validation? schema,dtd
        end
      end

      module InstanceMethods
        # Add instance methods here
      end
    end
  end
end

