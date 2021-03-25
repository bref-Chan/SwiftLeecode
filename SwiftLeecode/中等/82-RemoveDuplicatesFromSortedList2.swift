//
//  82-RemoveDuplicatesFromSortedList2.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/25.
//

import Foundation

/**
 
 存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除链表中所有存在数字重复情况的节点，只保留原始链表中 没有重复出现 的数字。

 返回同样按升序排列的结果链表。

 示例 1：

 输入：head = [1,2,3,3,4,4,5]
 输出：[1,2,5]
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class RemoveDuplicates {
    static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        //初级版本
//        var currentIsRepetition = false
//        var pre : ListNode? = head
//        var current : ListNode? = head
//        var newHead = head
//
//        while current != nil {
//            if current?.val == current?.next?.val {
//                //如果下一个节点数字与当前相同,将下个节点减除,将currentIsRepetition设置为true
//                current?.next = current?.next?.next
//                currentIsRepetition = true
//            }else{
//                //current后移,当前current赋值给pre,查看currentIsRepetition是否为true,为true说明当前current应被删除
//                if currentIsRepetition {
//                   //如果pre == current,current为头结点,将pre设置为current->next,并将newHead设置为current->next
//                    if pre?.val == current?.val {
//                        pre = current?.next
//                        newHead = current?.next
//                    }
//                    // 如果pre != current,pre不变,newHead不变,将current去掉即可
//                    else{
//                        pre?.next = current?.next
//                    }
//
//                    currentIsRepetition = false
//                    current = current?.next
//                }else{
//                    pre = current
//                    current = current?.next
//
//                }
//
//            }
//        }
//        return newHead
        
        
        
        // 方法二:
        // 思路:如果发现有重复的节点,记录起始节点位置,往下查找到结束以后直接抛掉中间的链
//        var dummy:ListNode = ListNode.init(0, head)
//        var pre = dummy
//        var current = head
//        var repeatBegin : ListNode?
//
//        while current != nil {
//            // 当current.val == current.next.val时,
//            if current?.val == current?.next?.val {
//                //处于重复区间头部或者中间
//                if repeatBegin == nil {
//                    repeatBegin = current
//                }
//            }else{
//                //处于重复区间尾部或者当前节点并不重复
//                if repeatBegin != nil {
//                    //处于重复区间尾部,将重复区间整个丢掉
//                    pre.next = current?.next
//                    repeatBegin = nil
//                }else{
//                    //当前节点并不重复,移动pre的位置
//                    pre = current!
//                }
//            }
//            current = current?.next
//        }
//
//        return dummy.next
        
        //思路3,使用递归.
        //使用递归的问题判断:
        //1.一个问题的解可以分解为几个问题的解
        //2.这个问题和分解后的子问题,除了数据规模不同,求解思路完全一样
        //3.存在递归终止条件
        //写出递归方法的步骤:1.写出递归公式,2.找到终止条件
        
        //终止条件应为:head为空,应该终止,返回nil
        //如果head.next为空,说明链中只有一个节点,返回head
        
        //递归公式:如果head.val == head.next.val,说明head应该被抛掉,那head.next节点抛不抛掉呢,不知道.要直到遇见不相等的end节点时时才将head.next抛掉,
        //return deleteDuplicates(end)
        //如果head.next != head,那么说明不重复,head.next = deleteDuplicates(head.next)
        //如果一路走来都没有触发第一种情况,说明后续都是不重复的,return head就可以了
        
        //终止条件
        if head == nil || head?.next == nil {
            return head
        }
        
        if head?.val == head?.next?.val {
            var end = head?.next
            while end != nil && end?.val == head?.val {
                end = end?.next
            }
            return deleteDuplicates(end)
        }else{
            head?.next = deleteDuplicates(head?.next)
        }
        return head
    }
}
