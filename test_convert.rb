
require_relative "convert"
require "test/unit"

class TestConvert < Test::Unit::TestCase

  def setup
    # pass
  end

  def teardown
    # pass
  end

  def test_invalid
      assert_throws(ArgumentError) {Convert.string_to_integer('kmkywap')}
      assert_throws(ArgumentError) {Convert.string_to_integer('.')}
      assert_throws(ArgumentError) {Convert.string_to_integer('.0')}
      assert_throws(ArgumentError) {Convert.string_to_integer('.9')}
  end

  def test_well_behaved
      assert_nothing_thrown() {Convert.string_to_integer('1')}
  end

  def test_signs
      assert_equal(1, Convert.string_to_integer('1'))
      assert_equal(1, Convert.string_to_integer('+1'))
      assert_equal(1, Convert.string_to_integer(' + 1 '))
      assert_equal(-1, Convert.string_to_integer('-1'))
      assert_equal(-1, Convert.string_to_integer(' - 1 '))
      assert_equal(0, Convert.string_to_integer('0'))
      assert_equal(0, Convert.string_to_integer('+0'))
      assert_equal(0, Convert.string_to_integer(' + 0 '))
      assert_equal(0, Convert.string_to_integer('-0'))
      assert_equal(0, Convert.string_to_integer(' - 0 '))
      assert_throws(ArgumentError) {Convert.string_to_integer('+-1')}
      assert_throws(ArgumentError) {Convert.string_to_integer('-+1')}
  end

  def test_float_valid
      assert_equal(1, Convert.string_to_integer('1.1'))
      assert_equal(1, Convert.string_to_integer('1.8'))
      assert_equal(1, Convert.string_to_integer('1.'))
      assert_equal(1, Convert.string_to_integer('+1.8'))
      assert_equal(-1, Convert.string_to_integer('-1.9'))
      assert_equal(1, Convert.string_to_integer(' + 1.9....3 '))
  end

  def test_large_valid
      assert_equal(123456789, Convert.string_to_integer('0123456789'))
      assert_equal(9876543210, Convert.string_to_integer('9876543210'))
      assert_equal(9876543210987654321098765432109876543210,
                   Convert.string_to_integer('9876543210987654321098765432109876543210'))
  end

end
