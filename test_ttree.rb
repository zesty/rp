require_relative "ttree.rb"
require "test/unit"

class TestTernaryTree < Test::Unit::TestCase

  def test_well_behaved
    t = TernaryTree.new([])
    assert_nothing_thrown() { t.add(1) }
  end

  def test_constructor
    #     5
    #    /|\
    #   4 5 9
    #  /   /
    #  2  7
    #  |
    #  2
    t = TernaryTree.new([5, 4, 9, 5, 7, 2, 2])
    assert_equal(3, t.left_size)
    assert_equal(1, t.mid_size)
    assert_equal(2, t.right_size)
    assert_equal(7, t.total_size)
  end

  def test_building_size
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

  def test_building_vals
    #     5
    #    /|\
    #   4 5 9
    #  /   /
    #  2  7
    #  |
    #  2
    t = TernaryTree.new()
    assert_equal(nil, t.get_val(''))
    assert_equal(nil, t.get_val('l'))
    assert_equal(nil, t.get_val('m'))
    assert_equal(nil, t.get_val('r'))
    t.add(5)
    assert_equal(5, t.get_val(''))
    assert_equal(nil, t.get_val('l'))
    assert_equal(nil, t.get_val('m'))
    assert_equal(nil, t.get_val('r'))
    t.add(4)
    assert_equal(4, t.get_val('l'))
    assert_equal(4, t.get_val('L'))
    t.add(9)
    assert_equal(9, t.get_val('r'))
    assert_equal(9, t.get_val('R'))
    t.add(5)
    assert_equal(5, t.get_val('m'))
    assert_equal(5, t.get_val('M'))
    t.add(7)
    assert_equal(7, t.get_val('rl'))
    assert_equal(7, t.get_val('rL'))
    assert_equal(7, t.get_val('Rl'))
    assert_equal(7, t.get_val('RL'))
    t.add(2)
    assert_equal(2, t.get_val('ll'))
    t.add(2)
    assert_equal(2, t.get_val('llm'))

    assert_equal(5, t.get_val(''))
    assert_equal(4, t.get_val('l'))
    assert_equal(5, t.get_val('m'))
    assert_equal(9, t.get_val('r'))
    assert_equal(2, t.get_val('ll'))
    assert_equal(7, t.get_val('rl'))
    assert_equal(2, t.get_val('llm'))

    #     5
    #    /|\
    #   4 5 9
    #  /   /
    #  2  7
    #  |
    #  2

    # 4
    assert_equal(nil, t.get_val('lm'))
    assert_equal(nil, t.get_val('lr'))

    # 5 (bottom)
    assert_equal(nil, t.get_val('ml'))
    assert_equal(nil, t.get_val('mm'))
    assert_equal(nil, t.get_val('mr'))

    # 9
    assert_equal(nil, t.get_val('rm'))
    assert_equal(nil, t.get_val('rr'))

    # 2 (top)
    assert_equal(nil, t.get_val('lll'))
    assert_equal(nil, t.get_val('llr'))

    # 7
    assert_equal(nil, t.get_val('rll'))
    assert_equal(nil, t.get_val('rlm'))
    assert_equal(nil, t.get_val('rlr'))

    # 2 (bottom)
    assert_equal(nil, t.get_val('llml'))
    assert_equal(nil, t.get_val('llmm'))
    assert_equal(nil, t.get_val('llmr'))

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
