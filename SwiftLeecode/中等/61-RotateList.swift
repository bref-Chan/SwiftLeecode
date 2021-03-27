//
//  61-RotateList.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/27.
//

import Foundation


class RotateList {
    
    static func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 {
            return head
        }
        
        //第一步,将链表处理为循环链表,并记录链表长度
        var curren = head
        var length = 1
        while curren?.next != nil {
            curren = curren?.next
            length = length + 1
        }
        
        curren?.next = head
        
        //循环链表改造成功,判断需要旋转的次数
        var trueK = k % length
        trueK = length - trueK
        
        var result = head
        var pre = curren
        for _ in 0..<trueK {
            pre = result
            result = result?.next
        }
        
        pre?.next = nil
        return result
        
        
    }
}
