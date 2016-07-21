class Api::V1::Merchants::MostItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.most_items(params[:quantity])
  end
end
