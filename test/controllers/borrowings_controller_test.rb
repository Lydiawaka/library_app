require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    sign_in_as(@user)
  end

  test "should create borrowing" do
    assert_difference("Borrowing.count") do
      post borrowings_url, params: { borrowing: { book_id: @book.id } }
    end
    assert_redirected_to book_url(@book)
  end

  test "should destroy borrowing" do
    borrowing = Borrowing.create(user: @user, book: @book, due_date: 2.weeks.from_now)
    assert_difference("Borrowing.count", -1) do
      delete borrowing_url(borrowing)
    end
    assert_redirected_to user_url(@user)
  end

  private

  def sign_in_as(user)
    post session_url, params: { email: user.email, password: "password" }
  end
end
