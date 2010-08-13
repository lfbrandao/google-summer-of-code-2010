ActionController::Routing::Routes.draw do |map|
  map.resources :plugins

  # Application root
  map.root :controller => 'hosts', :action => 'search'

  # Hosts
  map.connect '', :controller => "hosts", :action => "search"
  map.connect 'hosts/search.:format', :controller => 'hosts', :action => 'search'
  map.connect 'hosts/index.:format', :controller => 'hosts', :action => 'index'

  map.resources :roles
  map.resources :repositories
  
  # Authlogic routes
  map.login 'login', :controller => 'user_sessions', :action => 'new'  
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'  
  
  # Authlogic routes - registration
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  
  map.connect 'users/:action/:id', :controller => "users"
  map.connect 'account/:action/:id', :controller => "users"
end