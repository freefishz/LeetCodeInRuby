# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# solution 1: using Set
# @param {ListNode} head
# @return {ListNode}
def detectCycle(head)
  scaned = Set.new
  while head
    return head if scaned.include? head

    scaned << head
    head = head.next
  end
  nil
end

# solution 2: using two pointer: slow, fast
def detectCycle(head)
  # phase 1: detect if cycle exists.
  slow = fast = head
  while fast&.next
    slow = slow.next
    fast = fast.next.next
    break if slow == fast
  end

  return nil if fast.nil? || fast.next.nil?

  # pahse 2: from meeting point to where the cycle begins.
  fast = head
  while fast != slow
    fast = fast.next
    slow = slow.next
  end

  fast
end
