require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
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
end
