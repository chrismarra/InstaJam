Instajam::Application.routes.draw do
  
  get "pages/home"

  root :to => 'pages#home'
  match ":token" => "pages#show"
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :admins

  resources :jams
  

end
