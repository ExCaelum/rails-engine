class Api::V1:ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Items.all
  end

end
