Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'

  resources :devices, path: '/device', only: [:index, :show]

  post '/dapi/heartbeat', to: 'device_api#heartbeat'
  post '/dapi/button', to: 'device_api#button'
end
