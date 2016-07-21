class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.total_revenue_by_date(params[:date])
  end

  def ranked
    respond_with Merchant.most_revenue_by_quantity(params[:quantity])
  end

end