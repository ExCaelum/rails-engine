require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest

  test "can retrieve a list of items for index" do
    get "/api/v1/items"

    assert_response :success
    items = JSON.parse(response.body)
    assert_equal 3, items.count
  end
  test "can get a single item to render on show page" do
    item = items(:one)
    get "/api/v1/items/#{item.id}"

    assert_response :success
    parsed_item = JSON.parse(response.body)
    assert_equal item.id, parsed_item["id"]
    assert_equal item.name, parsed_item["name"]
    assert_equal item.merchant_id, parsed_item["merchant_id"]
    assert_equal item.description, parsed_item["description"]
  end
end
