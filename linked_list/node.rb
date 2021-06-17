# frozen_string_literal: true

# Represents a node in a linked list.
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, nxt = nil)
    @value = value
    @next_node = nxt
  end
end