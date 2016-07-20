class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Customer.order("RANDOM()").first
  end

end
