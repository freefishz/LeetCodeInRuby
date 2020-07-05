# frozen_string_literal: true

class MyStack
  #   Initialize your data structure here.
  def initialize
    @queue1 = []
    @queue2 = []
  end

  #   Push element x onto stack.
  #   :type x: Integer
  #   :rtype: Void
  def push(x)
    q = @queue1.empty? ? @queue2 : @queue1
    q.push x
  end

  #   Removes the element on top of the stack and returns that element.
  #   :rtype: Integer
  def pop
    _exchange
  end

  #   Get the top element.
  #   :rtype: Integer
  def top
    _exchange(true)
  end

  #   Returns whether the stack is empty.
  #   :rtype: Boolean
  def empty
    @queue1.empty? && @queue2.empty?
  end

  private

  # Move elements from one queue to another queue
  # :type full_exchange: Boolean
  # if set true, all elements will be moved.
  # if set false, the last element will be left.
  def _exchange(full_exchange = false)
    empty_queue, non_empty_queue = @queue1, @queue2
    empty_queue, non_empty_queue = non_empty_queue, empty_queue unless @queue1.empty?

    empty_queue.push non_empty_queue.shift while non_empty_queue.size > 1

    ret = non_empty_queue.shift
    empty_queue.push ret if full_exchange
    ret
  end
end

# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()
