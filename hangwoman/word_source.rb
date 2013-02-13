# type in a word to use for the game
# only letters allowed

def get_word
  puts 'Type a word: '
  input_string = gets.strip.downcase
  is_a_word = true
  input_string.each_char do |letter|
    if ('a'..'z').include?(letter) && is_a_word == true
      is_a_word = true
    else
      is_a_word = false
    end
  end
  if is_a_word
     input_string
  else
     puts "You have to type in a word"
     get_word
  end
end

word = get_word
puts "You typed in ´#{word}´."
