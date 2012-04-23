Instajam::Application.routes.draw do

  root :to => 'pages#home'
  
  match "/jams" => "jams#create"
  match "/jam/:token" => "jams#show"


end
