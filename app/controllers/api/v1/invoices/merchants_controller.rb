class Api::V1::Invoices::MerchantsController < ApplicationController
  respond_to :json, :xml

  def show
    invoice = Invoice.find(params[:id])
    respond_with invoice.merchant
  end

end
