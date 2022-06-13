require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should able to add money to the account balance" do
    post add_money_user_url(@user), params: { amount: 80 }, as: :json
    assert_equal "Added amount successfully in the account", JSON.parse(@response.body)["message"]
    assert_equal 170.0, @user.reload.balance.to_f
    assert_response :success
  end

  test "should return error if user not found" do
    post add_money_user_url(3), params: { amount: 80 }, as: :json
    assert_equal "API params are not correct", JSON.parse(@response.body)["message"]
    assert_response :unprocessable_entity
  end
end
