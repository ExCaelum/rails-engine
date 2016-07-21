require "test_helper"

class Api::V1::Customers::TransactionsControllerTest < ActionDispatch::IntegrationTest

  test "can return a collection of a customers transactions" do
    customer = customers(:one)
    get "/api/v1/customers/#{customer.id}/transactions"

    assert_response :success

    
  end
end
