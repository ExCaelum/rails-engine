require 'test_helper'

class Api::V1::Items::MerchantsControllerTest < ActionDispatch::IntegrationTest

  test "returns merchants" do
    item = items(:one)
    get "/api/v1/items/#{item.id}/merchant"

    assert_response :success
    response_item = JSON.parse(response.body)
    assert_equal item.merchant.id, response_item["id"]
  end

end
