Rails.application.routes.draw do
  
  root 'home#top'
  get 'top'=>'home#top'
  get 'about'=>'home#about'
  # get 'posts/index'
  get 'posts'=>'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:id'=>'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post 'post/:id/destroy' => 'posts#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
