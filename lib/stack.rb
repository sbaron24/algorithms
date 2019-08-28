class StackUnderflow < StandardError
end

class StackOverflow < StandardError
end

class Stack
  def initialize
    @contents = []
    @index = 0
  end

  def push(item)
    raise StackOverflow if maxed?
    @index +=1
    @contents[@index] = item
  end

  def peek
    @contents[@index]
  end

  def pop
    raise StackUnderflow if empty?
    result = peek
    @index -= 1
    result
  end

  def empty?
    @index == -1
  end

  def maxed?
    @index == 1000
  end
end
