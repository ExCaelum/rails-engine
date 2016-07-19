class Api::V1::Items::SearchController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.where(item_params)
  end

  def show
    if params["unit_price"]
      price = params["unit_price"].delete(".").to_i
      respond_with Item.find_by(unit_price: price)
    else
      respond_with Item.where(item_params).first
    end
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end
