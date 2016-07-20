class Api::V1::Items::BestDayController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Item.find(params[:id]), serializer: BestDaySerializer
  end

end
