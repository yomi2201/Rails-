Rails.application.routes.draw do
  
  get  'login' =>'users#login_form'
  post 'login' =>'users#login'
  post 'logout' =>'users#logout'
  get  'users' => 'users#index'
  get  'signup' => 'users#new'
  get  "users/:id/edit" => 'users#edit'
  post 'users/create' => 'users#create'
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get  "users/:id"=>"users#show"

  root 'home#top'
  get  '/'=>'home#top'
  get  'about'=>'home#about'

  get  'posts'=>'posts#index'
  get  'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'

  get  "posts/:id/edit" => 'posts#edit'
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get  "posts/:id"=>"posts#show"
end
