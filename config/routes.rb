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

  #Main redirects from old website
  get "/hpl-blog" => redirect("/posts")
  get "/book-now" => redirect("/properties")
  get "/the-lodges" => redirect("/properties")
  get "/cottages-in-the-country" => redirect("/properties?query[in_country]=true")
  get "/lodges-in-aviemore" => redirect("/properties?query[in_aviemore]=true")
  get "/hot-tub-page" => redirect("/properties?query[sauna_or_hot_tub]=true")
  get "/2---6-sleeper-lodges" => redirect("/properties")
  get "/7--12-sleeper-lodges" => redirect("/properties")

  #Lodge redirects from old website
  get "/douglas-cottage---sleeps-6" => redirect("/properties/4")
  get "/westcott---sleeps-6" => redirect("/properties/13")
  get "/the-bothy---sleeps-4" => redirect("/properties/9")
  get "/cairn-eilrig---sleeps-6" => redirect("/properties/3")
  get "/the-old-smithy---sleeps-4--2" => redirect("/properties/10")
  get "/riverside-lodge---sleeps-6" => redirect("/properties/6")
  get "/rymore-wood-lodge---sleeps-8" => redirect("/properties/7")
  get "/tomdhu-lodge---sleep-8" => redirect("/properties/11")
  get "/trails-end-lodge---sleeps-8" => redirect("/properties/12")
  get "/foresters-lodge---sleeps-10" => redirect("/properties/5")
  get "/burnbrae-lodge---sleeps-8" => redirect("/properties/2")
  get "/alltnacriche---sleeps-10" => redirect("/properties/1")
  get "/smithy--riverside-lodge---sleeps-10--2" => redirect("/properties/8")

  #Other page redirects from old website
  get "/contact" => redirect("/pages/contact")
  get "/go-catered" => redirect("/pages/go_catered")
  get "/about-us" => redirect("/pages/about_us")
  get "/about-the-area" => redirect("/pages/about_the_area")
  get "/pet-friendly" => redirect("/pages/pet_friendly")
  get "/families" => redirect("/pages/families")
  get "/reviews" => redirect("/pages/reviews")
  get "/own-a-property" => redirect("/pages/own_a_property")
  get "/terms-and-conditions" => redirect("/pages/terms_and_conditions")
  get "/privacy-policy" => redirect("/pages/privacy_policy")
  get "/frequently-asked-questions" => redirect("/pages/frequently_asked_questions")

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/about_the_area'
  get 'pages/contact'
  get 'pages/own_a_property'
  get 'pages/go_catered'
  get 'pages/pet_friendly'
  get 'pages/families'
  get 'pages/about_us'
  get 'pages/terms_and_conditions'
  get 'pages/frequently_asked_questions'
  get 'pages/reviews'
  get 'pages/privacy_policy'
  get 'pages/cookies'
end
