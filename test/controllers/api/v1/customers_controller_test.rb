require "test_helper"

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "can retrieve a list of customers on index" do
    get "/api/v1/customers"

    assert_response :success
    customers = JSON.parse(response.body)
    assert_equal 2, customers.count
  end
  test "can retrieve a single customer on show" do
    customer = customers(:one)
    get "/api/v1/customers/#{customer.id}"

    assert_response :success
    parsed_customer = JSON.parse(response.body)
    assert_equal customer[:first_name], parsed_customer["first_name"]
    assert_equal customer[:last_name], parsed_customer["last_name"]
  end
end
