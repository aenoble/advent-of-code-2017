require 'test/unit'

class SpiralMemoryAdjacentTest < Test::Unit::TestCase
  def test_case_1
    assert_equal(spiral_memory_adjacent(1), 2)
  end
  def test_case_2
    assert_equal(spiral_memory_adjacent(2), 4)
  end
  def test_case_3
    assert_equal(spiral_memory_adjacent(10), 11)
  end
  def test_case_4
    assert_equal(spiral_memory_adjacent(11), 23)
  end
  def test_case_5
    assert_equal(spiral_memory_adjacent(23), 25)
  end
  def test_case_6
    assert_equal(spiral_memory_adjacent(747), 806) 
  end
end

SpiralNode = Struct.new(:x, :y, :value)

class SpiralMemoryAdjacent
  DIRECTIONS = {
    right: {x: 1, y: 0},
    up: {x: 0, y: 1},
    left: {x: -1, y: 0},
    down: {x: 0, y: -1},
  }

  def initialize(target)
    @nodes = []
    @target = target
    make_nodes(target)
  end

  def next_value
  end

  private

  def make_nodes(target)
    x = y = 0
    value = 1
    direction = DIRECTIONS[:left]
    while value < target
      get_next_direction(x, y, direction)

      @nodes.push SpiralNode.new(x, y, value)
    end
  end

  def get_next_direction(x, y, direction)
  end
end

def spiral_memory_adjacent(value)
  SpiralMemoryAdjacent.new(value).next_value
end
