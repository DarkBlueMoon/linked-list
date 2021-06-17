# frozen_string_literal: true

# Represents a node in a linked list.
class Node
  attr_accessor :next_node, :value

  def initialize(data = nil, nxt = nil)
    @value = data
    @next_node = nxt
  end
end

# A linked list
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if head.nil?
      self.head = Node.new(value)
      self.tail = head
    else
      node = Node.new(value)
      tail.next_node = node
      self.tail = node
    end

    self.size += 1
  end

  def prepend(value)
    node = Node.new(value, head)
    self.head = node
    self.size += 1
  end

  def to_s
    tmp = head
    print 'List: '
    until tmp.nil?
      print "(#{tmp.value}) -> "
      tmp = tmp.next_node
    end
    puts 'nil'
  end

  def at(index)
    tmp = head
    idx = 0

    until idx == index
      tmp = tmp.next_node
      idx += 1
    end

    tmp
  end

  def pop
    tmp = head

    tmp = tmp.next_node until tmp.next_node == tail

    self.tail = tmp
    ret = tmp.next_node
    tail.next_node = nil
    ret
  end
end

l = LinkedList.new
l.append(1)
l.append(2)
l.append(3)
l.prepend(0)
# p l.at(2)

puts l
p l.pop
p l.pop
# p l.tail
puts l
