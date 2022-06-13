require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid" do
    user = User.new(first_name: "Kiran", last_name: "Kumawat", email: "kiran.kumawat1991@gmail.com")
    assert user.valid?
  end

  test "user email should be in valid format" do
    user = User.new(first_name: "Kiran", "last_name": "Kumawat", email: "kiran.k.com")
    assert user.invalid?
    user.email = "kiran.kumawat1991@gmail.com"
    assert user.valid?
  end

  test "user first_name, last_name and email is required" do
    user = User.new()
    assert user.invalid?
    assert_equal user.errors[:first_name], ["can't be blank"]
    assert_equal user.errors[:last_name], ["can't be blank"]
    assert_equal user.errors[:email], ["can't be blank", "is invalid"]
    user.first_name = "Bhavya"
    user.last_name = "Kumawat"
    user.email = "kumawatb@gmail.com"
    assert user.valid?
  end
end
