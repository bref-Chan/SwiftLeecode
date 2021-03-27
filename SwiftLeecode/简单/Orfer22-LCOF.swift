//
//  Orfer22-LCOF.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/28.
//

import Foundation

/**
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。

 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class OfferLCOF{
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
//
//        //用快慢指针的思路
//        var fast = head
//        var slow = head
//
//        //先让fast走k步
//            for _ in 0..<k {
//            fast = fast?.next
//        }
//
//        while fast != nil {
//            fast = fast?.next
//            slow = slow?.next
//        }
//
//        return slow
        
        //优化思路.将for循环去掉
        var fast = head
        var slow = head
        
        var t = 0
        while fast != nil {
            fast = fast?.next
            if t >= k {
                slow = slow?.next
            }
            t = t + 1
        }
        
        return slow
    }
}
