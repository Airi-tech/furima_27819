Rails.application.routes.draw do
  devise_for :users
  resource :items
  root to: 'items#index'
end
