ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'configurations', :action => 'index'
  map.connect '', :controller => 'configurations', :action => 'index'

  map.resources :configurations

  #map.resources :hosts
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
  
  map.connect 'hosts/filter.:format', :controller => 'hosts', :action => 'filter'
  map.connect 'hosts/index.:format', :controller => 'hosts', :action => 'index'
  map.login 'login', :controller => 'application', :action => 'destroy'
  
end
