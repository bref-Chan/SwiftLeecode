//
//  83-RemoveDuplicatesFromSortedList.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/26.
//

import Foundation

/**
 存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除所有重复的元素，使每个元素 只出现一次 。

 返回同样按升序排列的结果链表。

 
 示例 1：
 输入：head = [1,1,2]
 输出：[1,2]

 */

class RemoveDuplicates {
    static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        
        while current != nil {
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
                continue
            }
            
            current = current?.next
        }
        return head
    }
}
