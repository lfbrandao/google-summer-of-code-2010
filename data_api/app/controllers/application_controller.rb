class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      config = Configuration.find(:first)
      if not config.nil?
        username == config.user_name and password == config.password
      end
    end
  end  
end