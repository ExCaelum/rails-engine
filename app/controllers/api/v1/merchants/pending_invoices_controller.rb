class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end
end
