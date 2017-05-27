Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'

  resources :devices, path: '/device' do
    collection do
      post 'heartbeat'
    end
  end
end
