class Api::V1::Customers::SearchController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.where(customer_params)
  end

  def show
    respond_with Customer.find_by(customer_params)
  end

  private

  def customer_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
