class Api::V1::Transactions::SearchController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.where(transaction_params)
  end

  def show
    respond_with Transaction.find_by(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
