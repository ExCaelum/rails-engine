Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      namespace :invoices do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "search#index"
      end
      namespace :items do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "search#index"
      end
      namespace :invoice_items do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "search#index"
      end
      namespace :merchants do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
      end
      namespace :transactions do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
      end
      namespace :customer do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
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
