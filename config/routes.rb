Rails.application.routes.draw do
  root to: 'homes#top'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favorites do
    resources :favorite_comments
  end
  resources :users
end
