//
//  783-minimum-distance-between-bst-nodes.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/13.
//

import Foundation



class MinimumDistanceBetweenBSTNodes{
    var nodeMin = Int.max
    var prev : TreeNode?
    // 二叉树的前序中序后序的区别在于操作代码所放的位置
    func minDiffInBST(_ root: TreeNode?) -> Int {
        
        ldr(root)
        return nodeMin
    }
    
    func ldr(_ node:TreeNode?){
        if node == nil {
            return
        }
        
        ldr(node!.left)
        //在这里执行操作
        if self.prev != nil {
            self.nodeMin = min(self.nodeMin,node!.val - self.prev!.val)
        }
        self.prev = node
        ldr(node!.right)
    }
}
