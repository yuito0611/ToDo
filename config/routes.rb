Rails.application.routes.draw do
  get 'accounts/show'
  get 'accounts/edit'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#login"

  
  #ユーザー
  resources :users
  resource :account
  resource :session,only:[:create,:destroy] #セッション
  resource :account,only:[:show,:edit,:update]
  
  resources :tasks do
    get "search", on: :collection
  end
  resources :categories 
end
