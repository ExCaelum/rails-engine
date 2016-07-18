class Api::V1::InvoicesController < ApiBaseController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

end
