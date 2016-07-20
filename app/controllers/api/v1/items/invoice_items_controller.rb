class Api::V1::Items::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    item = Item.find(params[:id])
    respond_with item.invoice_items
  end

end
