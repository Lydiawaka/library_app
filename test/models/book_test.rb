require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "Author Name", isbn: "1234567890")
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save book without author" do
    book = Book.new(title: "Book Title", isbn: "1234567890")
    assert_not book.save, "Saved the book without an author"
  end

  test "should not save book without isbn" do
    book = Book.new(title: "Book Title", author: "Author Name")
    assert_not book.save, "Saved the book without an ISBN"
  end

  test "should not save book with duplicate isbn" do
    Book.create(title: "Book 1", author: "Author 1", isbn: "1234567890")
    book = Book.new(title: "Book 2", author: "Author 2", isbn: "1234567890")
    assert_not book.save, "Saved the book with a duplicate ISBN"
  end

  test "should save valid book" do
    book = Book.new(title: "Valid Book", author: "Valid Author", isbn: "0987654321")
    assert book.save, "Could not save the valid book"
  end
end