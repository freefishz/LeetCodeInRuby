# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# solution 1: using two pointer: slow, fast
# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  slow = fast = head
  while slow && fast && fast.next
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end
  false
end

# solution 2: using set
def hasCycle(head)
  scaned = Set.new
  while head&.next
    return true if scaned.include? head

    scaned << head
    head = head.next
  end
  false
end
