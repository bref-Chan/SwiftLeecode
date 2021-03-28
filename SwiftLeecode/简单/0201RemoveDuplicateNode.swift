//
//  0201RemoveDuplicateNode.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/29.
//

import Foundation

class RemoveDuplicateNode {
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        var dict = [Int:Int]()
        
        var current = head
        var pre : ListNode = ListNode.init(0, head)
        
        while current != nil {
            if dict[current!.val] == nil {
                dict[current!.val] = 1;
                pre = current!
            }else{
                pre.next = current?.next
            }
            
            current = current?.next
        }
        return head
    }
}
