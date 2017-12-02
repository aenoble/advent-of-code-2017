require 'test/unit'

class InverseCaptchaTest < Test::Unit::TestCase
  def test_base_1
    assert_equal(inverse_captcha(1212), 6)
  end
  def test_base_2
    assert_equal(inverse_captcha(1221), 0)
  end
  def test_base_3
    assert_equal(inverse_captcha(123425), 4)
  end
  def test_base_4
    assert_equal(inverse_captcha(123123), 12)
  end
  def test_base_5
    assert_equal(inverse_captcha(12131415), 4)
  end
end

def inverse_captcha(value)
  arr = value.to_s.split('').map(&:to_i)
  matches = []
  arr.each_with_index { |val, i|
    lookup_index = (i + (arr.count/2)) % arr.count
    matches.push val if val == arr[lookup_index]
  }
  matches.reduce(&:+).to_i
end
