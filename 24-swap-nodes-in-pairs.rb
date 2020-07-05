# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# solution 1: using recursion
# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  first = head
  second = head.next

  first.next = swap_pairs(second.next)
  second.next = first

  second
end

# solution 2: using loop
def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  pre = ListNode.new(-1) # reversed list
  first = head
  second = head.next
  head = head.next

  while first && second
    pre.next = second
    first.next = second.next
    second.next = first

    pre = first
    first = first.next
    second = first&.next
  end

  head
end
