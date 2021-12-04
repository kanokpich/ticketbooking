Rails.application.routes.draw do
  resources :users

  get 'main' ,to: "main#main"
  post 'login' ,to: "main#login"
  get 'register' ,to: "main#register"
  post 'register' ,to: "main#register_create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
