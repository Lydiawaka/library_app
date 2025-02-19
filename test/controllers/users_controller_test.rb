require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as(@user)
  end

  test "should show user" do
    get user_url(@user)  # Ensure you're passing the correct user
    assert_response :success
    assert_select "h1", "#{@user.email}'s Profile"
  end

  private

  def sign_in_as(user)
    post session_url, params: { session: { email: user.email, password: "password" } }
    follow_redirect!  # Follow redirect to verify login success
    assert_response :success  # Ensure login was successful
  end
end
