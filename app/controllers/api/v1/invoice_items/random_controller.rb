class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with InvoiceItems.order("RANDOM()").first
  end

end
