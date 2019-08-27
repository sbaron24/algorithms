require 'pry'

class LinkedList
  def initialize
    @head = nil
  end

  def each
    node = @head

    while !node.nil? do
      yield(node.data)
      node = node.next
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def [](index)
    access_node_at_index(index).data
  end

  def insert(index, value)
    previous_node = access_node_at_index(index-1)
    next_node = previous_node.next
    previous_node.next = Node.new(value, next_node)
    @head
  end

  def delete_at(index)
    previous_node = access_node_at_index(index-1)
    previous_node.next = previous_node.next.next
    index
  end

  private

  def access_node_at_index(index)
    count = 0
    node = @head
    until count == index do
      node = node.next
      count += 1
    end
    node
  end
end


class Node
  attr_accessor :data, :next
  def initialize(data, next_node)
    self.data = data
    self.next = next_node
  end
end
