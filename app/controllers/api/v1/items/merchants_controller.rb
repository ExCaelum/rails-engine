class Api::V1::Items::MerchantsController < ApplicationController
  respond_to :json, :xml

  def show
    item = Item.find(params[:id])
    respond_with item.merchant
  end

end
