class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.total_revenue_by_date(params[:date])
  end

  def show
    if params[:date]
      respond_with Merchant.find(params[:id]).revenue_by_date(params[:date])
    else
      respond_with Merchant.find(params[:id]), serializer: MerchantRevenueSerializer
    end
  end

end
