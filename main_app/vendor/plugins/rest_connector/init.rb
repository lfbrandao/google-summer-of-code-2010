# Include hook code here
require 'app/models/host'
require 'rest_connector'
Host.class_eval do
  extend Berkman::Acts::RESTConnector::SingletonMethods
end