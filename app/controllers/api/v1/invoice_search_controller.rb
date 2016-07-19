class Api::V1::InvoiceSearchController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Invoice.find(params[:id]) if params[:id]
    respond_with Invoice.find_by(name: params[:name]) if params[:name]
    respond_with Invoice.find(params[:id]) if params[:id]
    respond_with Invoice.find(params[:id]) if params[:id]
  end

end
