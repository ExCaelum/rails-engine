require "test_helper"

class Api::V1::MerchantsControllerTest < ActionDispatch::IntegrationTest

  test "can retrieve a list of merchants to render index" do
    get "/api/v1/merchants"

    assert_response :success
    merchants = JSON.parse(response.body)
    assert_equal 2, merchants.count
  end

  test "can retrieve a single merchant to render show" do
    merchant = merchants(:one)
    get "/api/v1/merchants/#{merchant.id}"

    assert_response :success
    parsed_merchants = JSON.parse(response.body)
    assert_equal merchant[:name], parsed_merchants["name"]
  end

end
