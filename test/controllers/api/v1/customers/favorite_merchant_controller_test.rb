require "test_helper"

class Api::V1::Customers::FavoriteMerchantControllerTest < ActionDispatch::IntegrationTest
  test "can retrieve favorite merchant" do
    merchant = merchants(:one)
    customer = customers(:one)
    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    assert_response :success
    parsed_merchant = JSON.parse(response.body)
    assert_equal merchant.name, parsed_merchant["name"]
  end
end
