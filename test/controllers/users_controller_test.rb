require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as(@user)
  end

  test "should show user" do
    get user_url
    assert_response :success
    assert_select "h1", "#{@user.email}'s Profile"
  end

  private

  def sign_in_as(user)
    post session_url, params: { email: user.email, password: "password" }
  end
end