Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'visible_objects#index'

  resources :binocular_objects, only: [:index, :show]
  resources :small_telescope_objects, only: [:index, :show]
end
