class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    customer = Customer.find(params[:id])
    render json: customer.transactions
  end
end
