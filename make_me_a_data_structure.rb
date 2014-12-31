=begin
asks the users some questions, then presents them with one of
several data structures tailored to their needs
=end

# the basic node class
# LL has a next
# heap has lchild rchild
# hash table has nothing
# these are all monkey patched later
class Node
end

# the Linked List class
class LinkedList
  attr_accessor :head
end

# the hashtable class
class HashTable
  @table = Array.new(1000)
end

# heap class
class Heap
  attr_accessor :root
end

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

  # get the data we're gonna store
  puts 'Enter, separated by spaces, the fields you want to store at each node.'
  fields = gets.chomp.split(' ')

  ds_file = open('ds.rb', 'w')
  #now actually generate the needed data structure
  file_text = ['class Node']
  case [order, lookup]
  when [false, false]
    # linked list
    fields.map { |x| 'attr_accessor :' + x }
    file_text << fields.join('\n')

  when [false, true]
    # hash_table
  when [true, false]
    # linked_list
  when [true, true]
    # heap
  end
end
