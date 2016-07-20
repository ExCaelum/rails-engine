require "test_helper"

class Api::V1::InvoicesController < ActionDispatch::IntegrationTest
  test "can retrieve a list of invoices for index" do
    get "/api/v1/invoices"

    assert_response :success

  end
end
