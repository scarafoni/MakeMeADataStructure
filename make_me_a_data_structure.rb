=begin
data structures:
  -linked list
  -hash table

start with stock classes
pick one based on what they want for access time
=end

if __FILE__ == $0
  puts "Is the order you put the data in important? [y/n]"
case gets.chomp
when 'y'
  print 'y'
when 'n'
  print 'n'
else
  print "fail"

  print order_important
end
