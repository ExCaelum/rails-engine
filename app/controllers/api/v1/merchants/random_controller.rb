class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Merchant.order("RANDOM()").first
  end

end
