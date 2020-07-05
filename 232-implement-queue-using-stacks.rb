# frozen_string_literal: true

class MyQueue
  #     Initialize your data structure here.
  def initialize
    @input  = []
    @output = []
  end

  #     Push element x to the back of queue.
  #     :type x: Integer
  #     :rtype: Void
  def push(x)
    @input.push x
  end

  #     Removes the element from in front of queue and returns that element.
  #     :rtype: Integer
  def pop
    _input_to_output
    @output.pop
  end

  #     Get the front element.
  #     :rtype: Integer
  def peek
    _input_to_output
    @output.last
  end

  #     Returns whether the queue is empty.
  #     :rtype: Boolean
  def empty
    @input.empty? && @output.empty?
  end

  private

  def _input_to_output
    @output.push @input.pop while @input.first if @output.empty? && !@input.empty?
  end
end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()
