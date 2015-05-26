require 'test/unit'
require './hangman.rb'

class TestHang < Test::Unit::TestCase
	
	def setup
		@words = words_length(load_dictionary)
	end


	def test_correct_length
		assert @words.all? { |word| word.length >= 5 && word.length <= 12 }
	end

end