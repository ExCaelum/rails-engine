require "test_helper"

class Api::V1::Customers::RandomControllerTest < ActionDispatch::IntegrationTest
  test "can return a customer from random controller" do
    customer = customers(:one)
    get "/api/v1/customers/random"

    assert_response :success
    parsed_customer = JSON.parse(response.body)
  end
end
