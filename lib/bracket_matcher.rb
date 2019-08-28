require_relative 'stack'

class BracketMatcher
  def initialize(string)
    @string = string
  end

  def valid?
    matchers = {'(' => ')', '[' => ']', '{' => '}'}
    string_stack = Stack.new
    @string.split('').each do |symbol|
      if symbol == '(' || symbol == '[' || symbol == '{'
        string_stack.push(symbol)
      else
        if matchers[string_stack.peek] == symbol
          string_stack.pop
        end
      end
    end
    string_stack.peek.nil?
  end
end
