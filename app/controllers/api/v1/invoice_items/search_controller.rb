class Api::V1::SearchController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItems.where(invoice_items_params)
  end

  def show
    respond_with InvoiceItems.find_by(invoice_items_params)
  end

  private

  def invoice_items_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

end
