=begin
data structures:
  -linked list
  -hash table

start with stock classes
pick one based on what they want for access time
=end

# simple IO function(s)
module IO
  # loops until a valid input comes
  def get_valid_input(inputs)
    loop do
      input = gets.chomp
      if inputs.include? input
        return input
      else
        puts 'error, invalid input'
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  include IO
  puts 'Is the order you put the data in important? [y/n]'
  case IO.get_valid_input(%w(y n))
  when 'y'
    puts 'y'
  when 'n'
    puts 'n'
  else
    puts 'UNKNOWN ERROR'
  end
end
