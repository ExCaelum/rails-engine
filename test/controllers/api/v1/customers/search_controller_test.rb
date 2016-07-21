require "test_helper"

class Api::V1::Customers::SearchControllerTest < ActionDispatch::IntegrationTest
  test "can retrieve a collection of customers from the search controller" do
    customer = customers(:one)
    customer2 = customers(:two)
    get "/api/v1/customers/find?name"

    assert_response :success
    parsed_customer = JSON.parse(response.body)
    assert_equal 3, parsed_customer.count
    assert_equal parsed_customer[:name], customer["name"]
  end
  test "can retrieve a single customer from search controller" do
    customer = customers(:one)
    get "/api/v1/customers/find?"

    assert_response :success
  end
end
