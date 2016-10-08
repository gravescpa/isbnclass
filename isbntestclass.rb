require "minitest/autorun"
require_relative 'isbnclass.rb'

class TestIsbn < Minitest::Test

	def test_valid_ten_digit_isbn_returns_true
		isbn = "0471958697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_empty_string_isbn_returns_false
		isbn = ""
		assert_equal(false, valid_isbn?(isbn))
	end

	def test_valid_isbn_with_spaces_returns_true
		isbn = "0 47 19 58 697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_isbn_with_dashes_returns_true
		isbn = "0-47-19-58-697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_invalid_isbn_10_returns_false
		isbn = "0-47-19 58 699"
		assert_equal(false, valid_isbn?(isbn))
	end

	def test_valid_isbn_10_returns_true
		isbn = "0471958697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_isbn_10__with_spaces_dashes_returns_true
		isbn = "0-47-19 58 697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_isbn_10_with_X_returns_true
		isbn = "877195869X"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_13_digit_isbn_returns_true
		isbn = "9780131495050"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_invalid_13_digit_isbn_returns_false
		isbn = "7780131495050"
		assert_equal(false, valid_isbn?(isbn))
	end

end