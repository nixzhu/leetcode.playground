//: [Previous](@previous)

/*
 2. Add Two Numbers

 https://leetcode.com/problems/add-two-numbers/

 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example:

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    var valueString: String {
        return "\(val)" + (next?.valueString ?? "")
    }
}

func test(_ f: (ListNode?, ListNode?) -> ListNode?) {
    do {
        let node1 = ListNode(1)
        assert(f(node1, nil)?.valueString == "1")
    }
    do {
        let node1 = ListNode(5)
        let node2 = ListNode(5)
        assert(f(node1, node2)?.valueString == "01")
    }
    do {
        let node1 = ListNode(1)
        let node2 = ListNode(9)
        node2.next = ListNode(9)
        assert(f(node1, node2)?.valueString == "001")
    }
    do {
        let node1 = ListNode(2)
        node1.next = ListNode(4)
        node1.next?.next = ListNode(3)
        let node2 = ListNode(5)
        node2.next = ListNode(6)
        node2.next?.next = ListNode(4)
        assert(f(node1, node2)?.valueString == "708")
    }
}

do {
    // 递归解法
    // 注意进位
    class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            return _addTwoNumbers(0, l1, l2)
        }

        private func _addTwoNumbers(_ carry: Int, _ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil, l2 == nil {
                return carry > 0 ? ListNode(carry) : nil
            }

            let sum = carry + (l1?.val ?? 0) + (l2?.val ?? 0)
            let node = ListNode(sum % 10)
            node.next = _addTwoNumbers(sum / 10, l1?.next, l2?.next)

            return node
        }
    }

    test(Solution().addTwoNumbers)
}

print("end")

//: [Next](@next)
