require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test "should not save borrowing without user" do
    borrowing = Borrowing.new(book: @book, due_date: 2.weeks.from_now)
    assert_not borrowing.save, "Saved the borrowing without a user"
  end

  test "should not save borrowing without book" do
    borrowing = Borrowing.new(user: @user, due_date: 2.weeks.from_now)
    assert_not borrowing.save, "Saved the borrowing without a book"
  end

  test "should not save borrowing without due_date" do
    borrowing = Borrowing.new(user: @user, book: @book)
    assert_not borrowing.save, "Saved the borrowing without a due date"
  end

  test "should save valid borrowing" do
    borrowing = Borrowing.new(user: @user, book: @book, due_date: 2.weeks.from_now)
    assert borrowing.save, "Could not save the valid borrowing"
  end
end
