class Api::V1::InvoiceItems::SearchController < ApplicationController
  respond_to :json

  def index
    if params["unit_price"]
      price = params["unit_price"].delete(".").to_i
      respond_with InvoiceItem.where(unit_price: price)
    else
      respond_with InvoiceItem.where(invoice_items_params)
    end
  end

  def show
    if params["unit_price"]
      price = params["unit_price"].delete(".").to_i
      respond_with InvoiceItem.find_by(unit_price: price)
    else
      respond_with InvoiceItem.find_by(invoice_items_params)
    end
  end

  private

  def invoice_items_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

end
