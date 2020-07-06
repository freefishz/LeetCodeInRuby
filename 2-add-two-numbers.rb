# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  res = cur = ListNode.new(0)
  carry = 0
  while l1 || l2
    first  = l1 ? l1.val : 0
    second = l2 ? l2.val : 0
    sum = first + second + carry

    node = if sum > 9
             carry = 1
             ListNode.new(sum % 10)
           else
             carry = 0
             ListNode.new(sum)
           end

    cur.next = node
    cur = node

    l1 = l1&.next
    l2 = l2&.next
  end

  cur.next = ListNode.new(carry) if carry > 0

  res.next
end
