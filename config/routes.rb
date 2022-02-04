Rails.application.routes.draw do
  resources :albums
  devise_for :users
  get 'home/index'
  get 'home/show'

  get '/all_albums', to: 'albums#all_albums'
  delete "images/:id/purge",to: "albums#purge", as: "purge_image"
  resources :home



  resources :home do
    collection do
      match 'search' => 'home#search', via: [:get, :post], as: :search
    end
  end
  get 'search',to: 'albums#search'
  resources :tags


  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end




