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
        guard let root = root else {
                return []
              }
        var res = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
            
        while !queue.isEmpty {
        
        var temp = [TreeNode]()
        var array = [Int]()
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            array.append(node.val)
            if node.left != nil {
            temp.append(node.left!)
            }
            if node.right != nil {
            temp.append(node.right!)
            }
        }
        
        res.append(array)
        queue.append(contentsOf: temp)
        }
        return res
            
    }
}
