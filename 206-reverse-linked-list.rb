# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# solution one 
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head if head.nil? || head.next.nil?

  ret = reverse_list(head.next)
  head.next.next = head
  head.next = nil

  ret
end

# solution two 
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  cur = head
  pre = nil
  cur.next, pre, cur = pre, cur, cur.next while cur
  pre
end
