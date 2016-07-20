class Api::V1::Items::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Item.order("RANDOM()").first
  end

end
