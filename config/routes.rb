Rails.application.routes.draw do
  post 'auth_user' => 'authentication#authenticate_user'
  post 'reg_user' => 'authentication#register_user'
  get 'home' => 'home#index'
  get 'conversations/index' => 'conversations#index'
  post 'conversations/create' => 'conversations#create'
  get 'messages/index' => 'messages#index'
  post 'messages/create' => 'messages#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
