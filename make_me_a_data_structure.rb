=begin
asks the users some questions, then presents them with one of
several data structures tailored to their needs
=end

# the basic node class
# stack has a next
# hash table has nothing

# simple IO function(s)
module MyIO
  # loops until a valid input comes
  def get_valid_input(prompt, inputs)
    loop do
      puts prompt
      input = gets.chomp
      if inputs.include? input return input
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
  # now actually generate the needed data structure
  if order
    # node class
    file_text = 'class Node\n'
    file_text << fields.map { |x| '  attr_accessor :' + x }.join('\n') + '\n'
    file_text << '  def initialize(next, ' + fields.join(', ') + ')\n'
    file_text << fields.map { |x| '    @' + x }.join('\n')
    file_text << '  end \n\n'
    file_text << 'end \n\n'
    # stack class
    file_text << 'class Stack\n'
    file_text << '  attr_accessor :head\n'
    file_text << '  def initialize()\n'
    file_text << '    head = Node.new("None"' + fields.join(', ') + '\n'
    file_text << '  end\n'
    file_text << '  \n'
    file_text << '  def push(newNode)\n'
    file_text << '    newNode.next = @head\n'
    file_text << '    @head=newNode\n'
    file_text << '  end\n'
    file_text << '  def pop()\n'
    file_text << '    temp = @head.next\n'
    file_text << '    @head.next = @head.next.next\n'
    file_text << '    return temp\n'
    file_text << '  end\n'
    file_text << 'end\n\n'
  else
    file_text = 'class Node\n'
    file_text << fields.map { |x| 'attr_accessor :' + x }.join('\n')
    file_text << '\n  def initialize(' + fields.join(', ') + ')\n'
    file_text << 'end \n\n'
    # stack class
    file_text << 'class Stack\n'
    file_text << '  attr_accessor :head\n'
    file_text << '  def initialize()\n'
    file_text << '    head = Node.new(' + fields.join(', ') + '\n'
    file_text << '  end\n'
    file_text << '  \n'
    file_text << '  def push(newNode)\n'
    file_text << '    newNode.next = @head\n'
    file_text << '    @head=newNode\n'
    file_text << '  end\n'
    file_text << '  def pop()\n'
    file_text << '    temp = @head.next\n'
    file_text << '    @head.next = @head.next.next\n'
    file_text << '    return temp\n'
    file_text << '  end\n'
    file_text << 'end\n\n'
    # hash_table
  end
end
