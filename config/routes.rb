Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "blogs#index"
  resources :blogs, only:[:new, :create, :index, :show, :destroy] do
    resources :comments, only:[:create, :destroy]
    resources :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update]

end
