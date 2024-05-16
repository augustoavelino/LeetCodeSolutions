//
//  AddTwoNumbers.swift
//  LeetCodeSolutions
//
//  Created by Augusto Avelino on 16/05/24.
//

import Foundation

enum AddTwoNumbers {
    class Solution {
        func add(_ l1: ListNode?, _ l2: ListNode?, up: Int) -> ListNode? {
            let v1 = l1?.val ?? 0
            let v2 = l2?.val ?? 0
            let sum = v1 + v2 + up
            let upNext = sum / 10
            let val = sum - upNext * 10
            if upNext > 0 || l1?.next != nil || l2?.next != nil {
                return ListNode(val, add(l1?.next, l2?.next, up: upNext))
            } else {
                return ListNode(val)
            }
        }
        
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            return add(l1, l2, up: 0)
        }
    }
}

extension AddTwoNumbers {
    public class ListNode: Equatable {
        public static func == (lhs: AddTwoNumbers.ListNode, rhs: AddTwoNumbers.ListNode) -> Bool {
            if let lNext = lhs.next, let rNext = rhs.next {
                return lhs.val == rhs.val && lNext == rNext
            }
            return lhs.val == rhs.val
        }
        
        public var val: Int
        public var next: ListNode?
        
        public init(_ val: Int = 0, _ next: ListNode? = nil) {
            self.val = val
            self.next = next
        }
    }
}
