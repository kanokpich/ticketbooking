Rails.application.routes.draw do
  resources :tickets
  resources :movies
  resources :chairs
  resources :timetables
  resources :theaters
  resources :users

  get 'main' ,to: "main#main"
  get 'login' ,to: "main#login"
  post 'login' ,to: "main#loged_in"
  get 'home' ,to: "main#home"
  get 'logout' ,to: "main#logout"
  get 'register' ,to: "main#register"
  post 'register' ,to: "main#register_create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
