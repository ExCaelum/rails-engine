Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do

      resources :items, only: [:index, :show] do
        collection do
          get "find", to: "items/search#show"
          get "find_all", to: "items/search#index"
          get "random", to: "items/search#index"
        end

        member do
          get "invoice_items", to: "items/invoice_items#index"
          get "merchant", to: "items/merchants#show"
          get "best_day", to: "items/best_day#show"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get "find", to: "invoice_items/search#show"
          get "find_all", to: "invoice_items/search#index"
          get "random", to: "invoice_items/search#index"
        end

        member do
          get "invoice", to: "invoice_items/invoices#show"
          get "item", to: "invoice_items/items#show"
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get "find", to: "invoices/search#show"
          get "find_all", to: "invoices/search#index"
          get "random", to: "invoices/search#index"
        end

        member do
          get "transactions", to: "invoices/transactions#index"
          get "invoice_items", to: "invoices/invoice_items#index"
          get "items", to: "invoices/items#index"
          get "customer", to: "invoices/customers#show"
          get "merchant", to: "invoices/merchants#show"
        end
      end

      resources :merchants, only: [:index, :show] do
        collection do
          get "find", to: "merchants/search#show"
          get "find_all", to: "merchants/search#index"
          get "random", to: "merchants/search#index"
          get "revenue", to: "merchants/revenue#index"
          get "most_revenue", to: "merchants/most_revenue#index"
        end

        member do
          get "items", to: "merchants/items#index"
          get "invoices", to: "merchants/invoices#index"
          get "customers_with_pending_invoices", to: "merchants/pending_invoices#index"
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get "find", to: "transactions/search#show"
          get "find_all", to: "transactions/search#index"
          get "random", to: "transactions/search#index"
        end

        member do
          get "invoice", to: "transactions/invoices#show"
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get "find", to: "customers/search#show"
          get "find_all", to: "customers/search#index"
          get "random", to: "customers/search#index"
        end

        member do
          get "invoices", to: "customers/invoices#index"
          get "transactions", to: "customers/transactions#index"
        end
      end
    end
  end
end
