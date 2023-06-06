Rails.application.routes.draw do
  devise_for :users
  root to: "dashboards#home"

  resources :games do
    resources :participations, only: ['new', 'create']
  end

  resources :participations, only: ['index', 'show', 'edit', 'update'] do
    resources :reviews, only: ['new', 'create']
  end
end
