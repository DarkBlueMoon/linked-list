# frozen_string_literal: true

# Represents a node in a linked list.
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, nxt = nil)
    @value = value
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
    n = Node.new(value)
    if head.nil?
      self.head = n
      self.tail = head
    else
      tail.next_node = n
      self.tail = n
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
    return unless index.between?(0, size)

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

  def contains?(value)
    tmp = head

    until tmp.nil?
      return true if tmp.value == value

      tmp = tmp.next_node
    end

    false
  end

  def find(value)
    tmp = head
    idx = 0

    until tmp.nil?
      return idx if tmp.value == value

      idx += 1
      tmp = tmp.next_node
    end

    nil
  end

  def insert_at(value, index)
    return unless index.between?(0, size)

    tmp = head
    idx = 0

    until idx == index - 1
      tmp = tmp.next_node
      idx += 1
    end

    node = Node.new(value, tmp.next_node)
    tmp.next_node = node
    self.size += 1
  end

  def remove_at(index)
    return unless index.between?(0, size)

    tmp = head
    idx = 0

    until idx == index - 1
      tmp = tmp.next_node
      idx += 1
    end

    remove = tmp.next_node
    tmp.next_node = remove.next_node
  end
end

l = LinkedList.new
l.append(1)
l.append(3)
l.at(10)
l.append(4)
# l.prepend(0)
# l.insert_at(2, 2)
# l.insert_at(2.5, 3)
# l.remove_at(3)

puts l
# puts l.size
