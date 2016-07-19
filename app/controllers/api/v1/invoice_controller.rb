class Api::V1::InvoiceController < ApplicationController
  respond_to :json, :xml
  
  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

end