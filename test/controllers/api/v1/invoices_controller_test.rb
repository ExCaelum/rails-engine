require "test_helper"

class Api::V1::InvoicesControllerTest < ActionDispatch::IntegrationTest
  test "can retrieve a list of invoices on index page" do
    get "/api/v1/invoices"

    assert_response :success
    invoices = JSON.parse(response.body)
    assert_equal 3, invoices.count
  end

  test " can retrieve a single invoice on show page" do
    invoice = invoices(:one)
    get "/api/v1/invoices/#{invoice.id}"

    assert_response :success
    parsed_invoice = JSON.parse(response.body)
    assert_equal invoice.id, parsed_invoice["id"]
    assert_equal invoice.customer_id, parsed_invoice["customer_id"]
    assert_equal invoice.merchant_id, parsed_invoice["merchant_id"]
    assert_equal invoice.status, parsed_invoice["status"]
  end
end
