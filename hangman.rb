
def load_dictionary
	what = []
	dictionary = File.open('5desk.txt').readlines
end

def words_length(words)
	words.map! { |word| word.strip } # Gets rid of white space
	words.keep_if { |word| word.length >= 5 && word.length <= 12 }
	
end

	WORDS =  words_length(load_dictionary)

	
#puts WORDS

word = WORDS.sample

puts word

def spaces(word)
	spaces_array = []
	word.length.times { spaces_array << "_ " }
	spaces_array
end

def letter_array(word)
	word.split('')
end

print spaces(word)
puts letter_array(word)

def guess
	
		puts "your guess?"
		print ">>"
		guess = gets.chomp.downcase
		
end

def number_wrong
	
	if @wrong > 0
		puts "You have #{@wrong} wrong guess."
		puts "#{6 - @wrong} left."
	else
	 puts	"Good job."
	end
end

def win 
	puts "Congradulations, the word was #{@guess} " 
	puts "You have won!!"
end

def save
	puts	"Please enter the name of the save."
	print ">>" 
	name = gets.chomp.downcase
	file = File.open("#{name}.txt", 'w')
	file.puts @spaces_array
	file.close
end

def play(word)
	@wrong = 0
	
	@spaces_array = spaces(word)
	while true
	@guess = guess
	correct = false
	
	if @guess == word
	 win  
	 return false	
	elsif @guess == "save"
		save	
		return false
	end

		letters = letter_array(word)
		letters.each_with_index do |letter, index| 
			if @guess == letter 
				correct = true
				@spaces_array[index] = letter
			end
		end
	
		if correct == false
			@wrong += 1 

		end

		@spaces_array.each { |space| print "#{space} "}
		
		 unless @spaces_array.any? { |space| space == "_ "} 
		 @guess = word
		 win
		 return false
		 end
		puts 
		puts
		number_wrong
	end
end





play(word)
