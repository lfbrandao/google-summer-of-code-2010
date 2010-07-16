ActionController::Routing::Routes.draw do |map|
  #map.resources :hosts
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
  
  map.connect 'hosts/filter.:format', :controller => 'hosts', :action => 'filter'
  map.connect 'hosts/index.:format', :controller => 'hosts', :action => 'index'
end
