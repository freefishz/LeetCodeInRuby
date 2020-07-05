# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# solution 1. using recursion
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  cur = head
  count = 0

  while cur && count != k
    cur = cur.next
    count += 1
  end

  if count == k
    cur = reverse_k_group(cur, k)
    while count > 0
      count -= 1
      head.next, cur, head = cur, head, head.next
    end
    head = cur
  end
  head
end

# solution 2. using loop
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return head if head.nil? || head.next.nil?

  pre = nil
  cur = head
  ret = ret
  while _has_k_nodes?(cur, k)
    sub_head, sub_tail, cur = _reverse(cur, k)

    ret ||= sub_head
    pre&.next = sub_head
    sub_tail.next = cur
    pre = sub_tail
  end
  ret
end

def _reverse(head, k)
  pre = nil
  cur = head
  while cur && k > 0
    cur.next, pre, cur = pre, cur, cur.next
    k -= 1
  end
  [pre, head, cur]
end

def _has_k_nodes?(head, k)
  cur = head
  count = 0
  while cur && count != k
    cur = cur.next
    count += 1
  end
  count == k
end
