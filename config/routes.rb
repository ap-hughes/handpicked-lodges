Rails.application.routes.draw do
  devise_for :admins, path: 'admin', skip: :registrations
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'pages#home'
  resources :properties, only: [ :index, :show ]
  resources :posts, only: [ :index, :show ]

  namespace :admin do
    resources :properties, only: [ :new, :index, :create, :edit, :update, :destroy ] do
      resources :features, only: [ :new, :create ]
      resources :photos, only: [ :new, :create ]
    end
    resources :features, only: [ :edit, :update, :destroy ]
    resources :photos, only: [ :edit, :update, :destroy ]
    resources :posts, only: [ :new, :index, :create, :edit, :update, :destroy ]
    resources :reviews, only: [ :new, :index, :create, :edit, :update, :destroy ]
  end
  resources :contact_emails, only: [:new, :create]

  get 'admin' => 'admin/properties#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/about_the_area'
  get 'pages/contact'
  get 'pages/own_a_property'
  get 'pages/go_catered'
  get 'pages/getting_here'
  get 'pages/pet_friendly'
  get 'pages/families'
  get 'pages/about_us'
  get 'pages/terms_and_conditions'
  get 'pages/frequently_asked_questions'
  get 'pages/reviews'
  get 'pages/privacy_policy'
end
