class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    customer = Customer.find(params[:id])
    render json: customer.transactions.flatten, each_serializer: TransactionSerializer
  end
end
