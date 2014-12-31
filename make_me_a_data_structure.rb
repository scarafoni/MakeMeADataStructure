=begin
data structures:
  -linked list
  -hash table

start with stock classes
pick one based on what they want for access time
=end

# simple IO function(s)
module MyIO
  # loops until a valid input comes
  def get_valid_input(prompt, inputs)
    loop do
      puts prompt
      input = gets.chomp
      if inputs.include? input
        return input
      else
        puts 'error, invalid input'
      end
    end
  end
  
  # specifically for yes no input
  def get_yn_input(prompt)
    loop do
      puts prompt
      case gets.chomp
      when 'y'
        return true
      when 'n'
        return false
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  include MyIO

  # is order important?
  prompt = 'Is the order you put the data in important? [y/n]'
  order = MyIO.get_yn_input(prompt, %w(y n))

  # is it important to have constant lookup?
  prompt = 'do you need it to have constant lookup time?'
  lookup = MyIO.get_yn_input(prompt, %w(y n))
  
  case [order, lookup]
  when 

end
