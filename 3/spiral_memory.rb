require 'test/unit'

class SpiralMemoryTest < Test::Unit::TestCase
  def test_case_1
    assert_equal(spiral_memory(1), 0)
  end
  def test_case_2
    assert_equal(spiral_memory(12), 3)
  end
  def test_case_3
    assert_equal(spiral_memory(23), 2)
  end
  def test_case_4
    assert_equal(spiral_memory(1024), 31)
  end
end

def spiral_memory(value)
  rung = 0
  steps_away_from_closest_corner = 0
  last_value_in_rung = 1
  while value > last_value_in_rung
    rung += 1
    corners = [2,4,6,8].map{|val| rung*val+last_value_in_rung}
    last_value_in_rung = 8 * rung + last_value_in_rung
    steps_away_from_closest_corner = corners.map{|corner| corner - value }.map(&:abs).min
  end
  (rung*2) - steps_away_from_closest_corner
end
