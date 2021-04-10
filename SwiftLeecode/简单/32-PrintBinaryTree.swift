//
//  Offer-32PrintBinaryTree.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/28.
//

import Foundation
/**
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。
 */


class PrintBinaryTree {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [];
        }
        
        var queue = [TreeNode]()
        var result = [[Int]]()
        
        queue.append(root!)
        while !queue.isEmpty {
            let length = queue.count
            var temp = [Int]()
            for _ in 0..<length {
                let node = queue.removeFirst()
                temp.append(node.val)
                
                if node.left != nil {
                    queue.append(node.left!)
                }
                
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            result.append(temp)
        }
        return result
    }
}
