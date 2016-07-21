require 'test_helper'

class Api::V1::Items::MostRevenueControllerTest < ActionDispatch::IntegrationTest

  test "returns item that made the most money " do
    get "/api/v1/items/most_revenue?quantity=1"
    assert_response :success
  end

end
