require 'test_helper'

class Api::V1::Items::MostRevenueControllerTest < ActionDispatch::IntegrationTest

  test "returns item that sold the most" do
    get "/api/v1/items/most_items?quantity=1"
    assert_response :success
  end

end
