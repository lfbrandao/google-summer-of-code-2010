ActionController::Routing::Routes.draw do |map|
  #map.resources :hosts

  map.connect 'hosts/search.:format', :controller => 'hosts', :action => 'search'
  map.connect 'hosts/index.:format', :controller => 'hosts', :action => 'index'
  
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
