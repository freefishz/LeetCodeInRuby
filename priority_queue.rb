# A binary PriortyQueue in ruby.
class PriorityQueue
  # min = true  - min binary heap
  # min = false - max binary heap
  def initialize(min=true)
    @min = min
    @elements = [nil]
  end

  def push(element)
    @elements.push element
    _up(@elements.size - 1)
  end

  def pop
    _exchange(1, @elements.size - 1)
    top = @elements.pop
    _down(1)
    top
  end

  def size
    @elements.size - 1
  end

  def peek
    @elements[1]
  end

  private

  def _down(index)
    child_index = index * 2
    return if child_index > @elements.size - 1
    
    left_element, right_element = @elements[child_index], @elements[child_index + 1]
    if @min
      child_index += 1 if right_element && right_element <= left_element
      return if @elements[index] <= @elements[child_index]
    else
      child_index += 1 if right_element && right_element >= left_element
      return if @elements[index] >= @elements[child_index]
    end

    _exchange(index, child_index)
    _down(child_index) 
  end

  def _up(index)
    return if index < 2

    parent_index = index / 2
    if @min
      return if @elements[parent_index] <= @elements[index]
    else
      return if @elements[parent_index] >= @elements[index]
    end

    _exchange(index, parent_index)
    _up(parent_index)
  end

  def _exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end
end