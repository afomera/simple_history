SimpleHistory::Engine.routes.draw do
  root to: "histories#index"

  resources :histories, only: [:index, :show]
end
