require 'test_helper'

class Api::V1::Items::SearchControllerTest < ActionDispatch::IntegrationTest

  test "can search by a parameter" do
    item = items(:one)
    get "/api/v1/items/find?name=#{item.name}"
    assert_response :success
    response_item = JSON.parse(response.body)
    assert_equal item.id, response_item["id"]
  end
  test "can search by a price" do
    item = items(:one)
    get "/api/v1/items/find?unit_price=#{item.unit_price}"
    assert_response :success
    response_item = JSON.parse(response.body)
    assert_equal item.id, response_item["id"]
  end
  test "can get a random item" do
    get "/api/v1/items/random"
    assert_response :success
    response_stuff = JSON.parse(response.body)
    response_item = Item.find(response_stuff.first["id"])
    assert_equal Item, response_item.class
  end

end
