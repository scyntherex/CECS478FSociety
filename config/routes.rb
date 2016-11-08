Rails.application.routes.draw do
  post 'auth_user' => 'authentication#authenticate_user'
  post 'reg_user' => 'authentication#register_user'
  get 'conversations/index' => 'conversations#index'
  post 'conversations/create' => 'conversations#create'
  get 'home' => 'home#index'
  get 'messages/index' => 'messages#index'
  resources :conversations do
  	resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
