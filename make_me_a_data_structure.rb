=begin
data structures:
  -linked list
  -hash table

start with stock classes
pick one based on what they want for access time
=end

if __FILE__ == $PROGRAM_NAME
  puts 'Is the order you put the data in important? [y/n]'
  case gets.chomp
  when 'y'
    puts 'y'
  when 'n'
    puts 'n'
  else
    puts 'fail'
  end
end
