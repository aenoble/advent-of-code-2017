require 'test/unit'

class PassphraseTest< Test::Unit::TestCase
  def test_case_1
    assert_equal(passphrase('aa bb cc dd ee'), true)
  end
  def test_case_2
    assert_equal(passphrase('aa bb cc dd aa'), false)
  end
  def test_case_3
    assert_equal(passphrase('aa bb cc dd aaa'), true)
  end
end

def passphrase(passphrase)
  passphrase.split(' ').length == passphrase.split(' ').uniq.length
end

def check_all_passphrases(file_path)
  File.readlines(file_path).select{|passphrase_string| passphrase(passphrase_string)}.length
end
