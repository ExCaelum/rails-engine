class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Invoice.order("RANDOM()").first
  end

end
