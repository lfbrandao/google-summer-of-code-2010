#Based on: http://juixe.com/techknow/index.php/2006/06/18/rails-plugin-tutorial/

module Berkman
  module Acts #:nodoc:
    module DatabaseConnector #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_databaseconnector
          include Berkman::Acts::DatabaseConnector::InstanceMethods
          extend Berkman::Acts::DatabaseConnector::SingletonMethods
        end
      end

      module SingletonMethods
        # Add class methods here
      end

      module InstanceMethods
        # Add instance methods here
        def database_query(user) 
          #
        end
      end
    end
  end
end

