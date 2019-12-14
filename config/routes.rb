Rails.application.routes.draw do
  root 'home#index'
  post 'search' => 'home#search'
  get 'show' => 'home#show'
  get 'favourite'=> 'home#favourite'
  get 'show_all' => 'home#show_all'
  get 'show_favourite' => 'home#show_favourite'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end