require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    sign_in_as(@user)  # Sign in before tests
  end

  test "should create borrowing" do
    assert_difference("Borrowing.count", 1) do
      post borrowings_url, params: { borrowing: { book_id: @book.id, user_id: @user.id, due_date: 2.weeks.from_now } }
    end
    assert_redirected_to borrowing_url(Borrowing.last)  # Ensure correct redirection
  end

  test "should destroy borrowing" do
    borrowing = Borrowing.create!(user: @user, book: @book, due_date: 2.weeks.from_now) # Ensure it saves
    assert_difference("Borrowing.count", -1) do
      delete borrowing_url(borrowing)
    end
    assert_redirected_to user_url(@user)  # Ensure correct redirection
  end

  private

  def sign_in_as(user)
    post session_url, params: { email: user.email, password: "password" }

    # Ensure login was successful
    assert_response :redirect
    follow_redirect!
    assert_response :success

    # Manually set session user_id for authentication persistence
    @current_user = user
  end
end
