require "test_helper"

class Api::V1::InvoiceItemsControllerTest < ActionDispatch::IntegrationTest
  test "can retrieve a list of invoice items on index page" do
    get "/api/v1/invoice_items"

    assert_response :success
    invoice_items = JSON.parse(response.body)
    assert_equal 2, invoice_items.count
  end

  test " can retrieve a single invoice item on show page" do
    invoice_item = invoice_items(:one)
    get "/api/v1/invoice_items/#{invoice_item.id}"

    assert_response :success
    parsed_invoice_item = JSON.parse(response.body)
    assert_equal invoice_item.id, parsed_invoice_item["id"]
    assert_equal invoice_item.invoice_id, parsed_invoice_item["invoice_id"]
    assert_equal invoice_item.quantity, parsed_invoice_item["quantity"]
    assert_equal "1.36", parsed_invoice_item["unit_price"]
  end
end
