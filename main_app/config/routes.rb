ActionController::Routing::Routes.draw do |map|
  

  map.root :controller => 'hosts', :action => 'search'
  map.connect '', :controller => "hosts", :action => "search"
  map.connect 'hosts/search.:format', :controller => 'hosts', :action => 'search'
  map.connect 'hosts/index.:format', :controller => 'hosts', :action => 'index'

  map.resources :roles
  map.resources :repositories
  map.devise_for :users #,  :controllers => { :registrations => "registrations" }
  map.connect 'hosts/index.:format', :controller => 'hosts', :action => 'index'
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
  map.connect 'users/', :controller => 'users', :action => 'index'
  
end
