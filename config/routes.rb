Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favorites do
    resources :favorite_comments
  end
end
