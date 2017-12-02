require 'test/unit'

class InverseCaptchaTest < Test::Unit::TestCase
  def test_base_1
    assert_equal(inverse_captcha(1122), 3)
  end

  def test_base_2
    assert_equal(inverse_captcha(1111), 4)
  end

  def test_base_3
    assert_equal(inverse_captcha(1234), 0)
  end
  def test_base_4
    assert_equal(inverse_captcha(91212129), 9)
  end
end

def inverse_captcha(value)
  arr = value.to_s.split('').map(&:to_i)
  matches = []
  arr.each_with_index { |val, i|
    next_val = (i+1 == arr.count) ? arr[0] : arr[i+1]
    matches.push val if val == next_val
  }
  matches.reduce(&:+).to_i
end
