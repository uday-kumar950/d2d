Rails.application.routes.draw do

  post '/vehicles' => 'vehicles#new', :defaults => { :format => 'json' }

  post '/vehicles/:id/locations'=> 'vehicles#locations', :defaults => { :format => 'json' }

  delete '/vehicles/:id' => 'vehicles#delete', :defaults => { :format => 'json' }

  root 'live_track#index'

  get 'live_track/get_vehicle_feeds/:id' => 'live_track#get_vehicle_feeds'

  get 'live_track/get_current_location/:id' => 'live_track#get_current_location'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
