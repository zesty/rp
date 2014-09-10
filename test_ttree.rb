
require_relative "ttree.rb"
require "test/unit"

class TestTernaryTree < Test::Unit::TestCase

  def setup
    # pass
  end

  def teardown
    # pass
  end

  def test_well_behaved
    t = TernaryTree.new([])
    assert_nothing_thrown() {t.add(1)}
  end

  def test_constructor
    t = TernaryTree.new([5, 4, 9, 5, 7, 2, 2])
    assert_equal(3, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(2, t.right_size)
    assert_equal(7, t.total_size)
  end

  def test_building
    t = TernaryTree.new()
    t.add(5)
    assert_equal(0, t.left_size)
    assert_equal(0, t.mid_size)
    assert_equal(0, t.right_size)
    assert_equal(1, t.total_size)
    t.add(4)
    assert_equal(1, t.left_size)
    assert_equal(0, t.mid_size)
    assert_equal(0, t.right_size)
    assert_equal(2, t.total_size)
    t.add(9)
    assert_equal(1, t.left_size)
    assert_equal(0, t.mid_size)
    assert_equal(1, t.right_size)
    assert_equal(3, t.total_size)
    t.add(5)
    assert_equal(1, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(1, t.right_size)
    assert_equal(4, t.total_size)
    t.add(7)
    assert_equal(1, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(2, t.right_size)
    assert_equal(5, t.total_size)
    t.add(2)
    assert_equal(2, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(2, t.right_size)
    assert_equal(6, t.total_size)
    t.add(2)
    assert_equal(3, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(2, t.right_size)
    assert_equal(7, t.total_size)
  end

  def test_float_valid
    t = TernaryTree.new([5.0, 4.0, 9.0, 5.0, 7.0, 2.0, 2.0])
    assert_equal(3, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(2, t.right_size)
    assert_equal(7, t.total_size)
  end

  def test_char_valid
    t = TernaryTree.new(['e', 'd', 'i', 'e', 'g', 'b', 'b'])
    assert_equal(3, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(2, t.right_size)
    assert_equal(7, t.total_size)
  end

end
