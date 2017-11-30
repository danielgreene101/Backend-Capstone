Rails.application.routes.draw do
  devise_for :users
  resources :characters
  root "characters#index"
end
