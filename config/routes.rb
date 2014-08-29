Rails.application.routes.draw do

  resources :storeditems do
    member do 
      get 'download'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'storeditems#index'
  get '/about' => 'about#index', as: :about

  # Authentication/sessions  routes
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
