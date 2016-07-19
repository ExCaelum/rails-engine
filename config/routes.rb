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
        get "find_all", to: "search#index", defaults: {format: :json}
        get "random", to: "search#index", defaults: {format: :json}
      end
      namespace :merchants do
        get "find", to: "search#show", defaults: {format: :json}
        get "find_all", to: "search#index", defaults: {format: :json}
        get "random", to: "random#show", defaults: {format: :json}
      end
      namespace :transactions do
        get "find", to: "search#show", defaults: {format: :json}
        get "find_all", to: "search#index", defaults: {format: :json}
        get "random", to: "random#show", defaults: {format: :json}
      end
      namespace :customers do
        get "find", to: "search#show", defaults: {format: :json}
        get "find_all", to: "search#index", defaults: {format: :json}
        get "random", to: "random#show", defaults: {format: :json}
      end

      resources :items, only: [:index, :show], defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}
      resources :invoices, only: [:index, :show], defaults: {format: :json}
      resources :merchants, only: [:index, :show], defaults: {format: :json}
      resources :transactions, only: [:index, :show], defaults: {format: :json}
      resources :customers, only: [:index, :show], defaults: {format: :json}
    end
  end
end
