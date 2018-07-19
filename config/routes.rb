Rails.application.routes.draw do
  root to: 'pages#home'
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
end
