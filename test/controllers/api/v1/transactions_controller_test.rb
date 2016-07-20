require "test_helper"

class Api::V1::TransactionsControllerTest < ActionDispatch::IntegrationTest

  test "can retrieve a list of transactions to render index" do
    get "/api/v1/transactions"

    assert_response :success
    transactions = JSON.parse(response.body)
    assert_equal 2, transactions.count
  end

  test "can retrieve a single transaction to render show" do
    transaction = transactions(:one)
    get "/api/v1/transactions/#{transaction.id}"

    assert_response :success
    parsed_transactions = JSON.parse(response.body)
    assert_equal transaction[:credit_card_number], parsed_transactions["credit_card_number"]
    assert_equal transaction[:invoice_id], parsed_transactions["invoice_id"]
    assert_equal transaction[:result], parsed_transactions["result"]
  end

end
