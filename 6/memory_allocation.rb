require 'test/unit'

class MemoryAllocationTest < Test::Unit::TestCase
  def test_case_1
    assert_equal(memory_allocation([0, 2, 7, 0]), 5)
  end
end

def memory_allocation(blocks)
  patterns = []
  while true
    value = blocks.max
    index = blocks.find_index(value)
    blocks[index] = 0
    step = 0
    while step < value
      step += 1 
      next_index = (index + step) % (blocks.length)
      blocks[next_index] += 1
    end
    patterns << blocks.dup
    break if patterns.length > 1 && (patterns.length != patterns.uniq.length)
  end
  patterns.length
end
