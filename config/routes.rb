Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get 'find_representatives', to: 'representative#find_representatives'
  resources :representative, only: :show
end
