require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "Invalid user signup" do
    get signup_path
    assert_no_difference 'User.count' do 
      post users_path, user: { name: "",
                               email: "not@valid",
                               password: "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end
end
