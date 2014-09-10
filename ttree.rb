# Implementation of a ternary tree
# The ternary tree is much like a binary tree but with 3 child nodes for
# each parent instead of two - with the left node being values < parent,
# the right node values > parent, and the middle node values == parent.
#
# Author::    Mike Leary  (mailto:mikeyfinn@gmail.com)
# Copyright:: Copyright (c) 2002 Mike Leary
# License::   Attribution-ShareAlike 2.5 Generic (CC BY-SA 2.5)

# This class can be used to instantiate a ternary tree two ways:
# 1) from the constructor by passing in an array of comparables,
# 2) by calling tree.add(item) on the ternary tree instance.
# You can always add more items using add().
#
class TernaryTree

  Val = 0 unless const_defined?(:Val)
  Left = 1 unless const_defined?(:Left)
  Mid = 2 unless const_defined?(:Mid)
  Right = 3 unless const_defined?(:Right)

  # Create a new ternary tree, optionally passing in and array of comparable items
  def initialize(int_ary=[])
    # nodes are just an array of length 4, see constants above for magic
    @root = mk_node()

    if 0 < int_ary.length
      @root[Val] = int_ary[0]
      int_ary[1..(int_ary.length-1)].each do |i|
        add(i)
      end
    end
  end

  # These are not the droids you're looking for
  def mk_node  # private
    [nil] * 4
  end

  # Add a new item to the ternary tree instance.
  # Item must be comparable to the other items in the tree, otherwise
  # the behavior is not defined.
  def add(val)
    node = @root

    # what you'd expect
    # only create nodes as needed, on the fly, maintaining tree ref integrity
    while true do
      if node[Val] == nil
        node[Val] = val
        return
      elsif val == node[Val]
        if nil == node[Mid]
          node = node[Mid] = mk_node()
        else
          node = node[Mid]
        end
        next
      elsif val < node[Val]
        if nil == node[Left]
          node = node[Left] = mk_node()
        else
          node = node[Left]
        end
        next
      else  # val > node[Val]
        if nil == node[Right]
          node = node[Right] = mk_node()
        else
          node = node[Right]
        end
        next
      end
    end

  end

  # Compute and return the size of the left tree originating at node.
  # Does NOT count node itself.
  def left_size(node=@root)
    size(node, Left)
  end

  # Compute and return the size of the mid tree originating at node.
  # Does NOT count node itself.
  def mid_size(node=@root)
    size(node, Mid)
  end

  # Compute and return the size of the right tree originating at node.
  # Does NOT count node itself.
  def right_size(node=@root)
    size(node, Right)
  end

  # Compute and return the size of the tree originating at node.
  # DOES count node itself.
  def total_size(node=@root)
    1 + left_size() + mid_size() + right_size()
  end

  # These are not the droids you're looking for
  def size(node, which)  # private
    # BFS, not that it matters too much here
    size = 0
    q = []
    q.push(node[which])

    while 0 < q.length
      node = q.shift()
      if nil == node
        next
      end

      size += 1

      if nil != node[Left]
        q.push(node[Left])
      end
      if nil != node[Mid]
        q.push(node[Mid])
      end
      if nil != node[Right]
        q.push(node[Right])
      end
    end
    size
  end

  # A string representation of the tree instance.  Nothing pretty.
  # Good for debugging.
  def to_s
    # BFS ... maybe refactor with to_s, but smaller, faster this way for most uses
    s = "root:" + @root[Val].to_s + "\n"
    node = @root

    q = []
    q.push(node)

    while 0 < q.length
      node = q.shift()
      if nil == node
        next
      end
      s += "node:" + node[Val].to_s

      if nil != node[Left]
        s += " left:" + node[Left][Val].to_s
        q.push(node[Left])
      end
      if nil != node[Mid]
        s += " mid:" + node[Mid][Val].to_s
        q.push(node[Mid])
      end
      if nil != node[Right]
        s += " right:" + node[Right][Val].to_s
        q.push(node[Right])
      end
      s += "\n"
    end
    s
  end

  private :mk_node, :size

end
