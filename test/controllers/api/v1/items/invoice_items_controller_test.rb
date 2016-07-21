require 'test_helper'

class Api::V1::Items::InvoiceItemsControllerTest < ActionDispatch::IntegrationTest

  test "returns invoice_items" do
    item = items(:one)
    get "/api/v1/items/#{item.id}/invoice_items"

    assert_response :success
    response_item = JSON.parse(response.body)
    assert_equal item.invoice_items, response_item
  end

end
