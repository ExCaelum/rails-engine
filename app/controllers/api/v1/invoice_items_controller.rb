class Api::V1:InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItems.all
  end

  def show
    respond_with InvoiceItems.find(params[:id])
  end

end
