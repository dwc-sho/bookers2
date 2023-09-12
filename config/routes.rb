Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about" , as: :about
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:create, :index]
end
