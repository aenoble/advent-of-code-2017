require 'test/unit'

class PassphraseTest< Test::Unit::TestCase
  def test_case_1
    assert_equal(passphrase('abcde fghij'), true)
  end
  def test_case_2
    assert_equal(passphrase('abcde xyz ecdab'), false)
  end
  def test_case_3
    assert_equal(passphrase('a ab abc abd abf abj'), true)
  end
  def test_case_4
    assert_equal(passphrase('iiii oiii ooii oooi oooo'), true)
  end
  def test_case_5
    assert_equal(passphrase('oiii ioii iioi iiio'), false)
  end
end

def passphrase(passphrase)
  passphrase.split(' ').length == passphrase.split(' ').map{|phrase| phrase.split('').sort.join}.uniq.length
end

def check_all_passphrases(file_path)
  File.readlines(file_path).select{|passphrase_string| passphrase(passphrase_string)}.length
end
