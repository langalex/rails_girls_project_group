# type in letters using the keyboard
# only return one lowercase letter
# if not a letter ask again

def get_letter
  puts 'Type a letter: '
  string = gets
  first_letter = string.downcase[0]
  if ('a'..'z').include?(first_letter)
    first_letter
  else
    puts "You do know what a letter is right?"
    get_letter # recursion
  end
end


letter = get_letter
puts "You typed in '#{letter}'."
