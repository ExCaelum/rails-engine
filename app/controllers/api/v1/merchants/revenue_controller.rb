class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.revenue_by_date, serializer: MerchantRevenueControllerSerializer
  end
end
