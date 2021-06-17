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
end

l = LinkedList.new
l.append(1)
p l.size
p l.head
p l.tail
l.append(2)
p l.size
p l.head
p l.tail
l.append(3)
p l.size
p l.head
p l.tail
# puts l.size
# p l.head
