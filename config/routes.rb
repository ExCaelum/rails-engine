Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get "find", to: "search#show", defaults: {format: :json}
        get "find_all", to: "search#index", defaults: {format: :json}
        get "random", to: "search#index", defaults: {format: :json}
      end
      namespace :items do
        get "find", to: "search#show", defaults: {format: :json}
        get "find_all", to: "search#index", defaults: {format: :json}
        get "random", to: "search#index", defaults: {format: :json}
      end
      namespace :invoice_items do
        get "find", to: "search#show", defaults: {format: :json}
        get "random", to: "search#index", defaults: {format: :json}
        get "find_all", to: "search#index", defaults: {format: :json}
      end

      resources :items, only: [:index, :show], defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}
  end
end
