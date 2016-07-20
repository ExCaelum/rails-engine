class Api::V1::Invoices::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    invoice = Invoice.find(params[:id])
    respond_with invoice.items
  end

end
