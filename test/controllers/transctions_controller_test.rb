require 'test_helper'

class TransctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transction = transctions(:one)
  end

  test "sell widget to buyer, when buyer have sufficient balance" do
    post transctions_url, params: { seller_id: users(:two).id, buyer_id: users(:one).id, widget_id: widgets(:one).id }, as: :json
    assert_response :success
    assert_equal 16.5, users(:one).reload.balance.to_f
    assert_equal 150.0, users(:two).reload.balance.to_f
  end

  test "buyer doesn't have sufficient balance to buy widget" do
    post transctions_url, params: { seller_id: users(:two).id, buyer_id: users(:one).id, widget_id: widgets(:three).id }, as: :json
    assert_response :unprocessable_entity
    assert_equal "Buyer doesn\'t have sufficient balance to buy", JSON.parse(@response.body)["message"]
  end
end
