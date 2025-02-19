require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # Ensure you have a user fixture
    sign_in_as(@user)    # Sign in before running the tests
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
    assert_select "h1", "All Books"
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
    assert_select "h1", @book.title
  end

  private

  def sign_in_as(user)
    post session_url, params: { session: { email: user.email, password: "password" } }
    follow_redirect!  # Follow the redirect after login
    assert_response :success  # Ensure login was successful
  end
end
