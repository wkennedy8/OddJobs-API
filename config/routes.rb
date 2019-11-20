Rails.application.routes.draw do
  resources :ratings
  resources :user_images
  resources :phones
  resources :contractor_images
  resources :credit_cards
  resources :job_images
  resources :job_postings
  resources :contracts
  resources :job_category_contractors
  resources :job_categories
  resources :contractors
  resources :user_profiles
  resources :addresses
  resources :states
  resources :city_zip_codes
  resources :zip_codes
  resources :cities
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
