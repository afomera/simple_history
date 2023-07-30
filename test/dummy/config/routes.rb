Rails.application.routes.draw do
  resources :tweets
  resources :posts
  mount SimpleHistory::Engine => "/simple_history"

  root to: "posts#index"
end
