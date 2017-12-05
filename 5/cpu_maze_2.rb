require 'test/unit'

class CPUMazeTest < Test::Unit::TestCase
  TEST_INPUT = "test_input.txt"
  def test_case_1
    assert_equal(cpu_maze(TEST_INPUT), 10)
  end
end

def cpu_maze(file_path)
  maze = File.readlines(file_path).map(&:to_i)
  index = 0
  steps = 0
  while index < maze.length
    step_inc = maze[index]
    maze[index] = (step_inc >= 3) ? step_inc - 1 : step_inc + 1
    index += step_inc
    steps += 1
  end
  steps
end
