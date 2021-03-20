//
//  637.-AverageOfLevelsInBinaryTree.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/20.
//

/**
 给定一个非空二叉树, 返回一个由每层节点平均值组成的数组。
 
 示例:
 输入：
     3
    / \
   9  20
     /  \
    15   7
 输出：[3, 14.5, 11]
 解释：
 第 0 层的平均值是 3 ,  第1层是 14.5 , 第2层是 11 。因此返回 [3, 14.5, 11]
 */

import Foundation


 // Definition for a binary tree node.
 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
 

class AOLIBT {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        if root==nil {
            return [0];
        }
        
        var result = [Double]()
        var queue : [TreeNode] = [root!]
        
        while !queue.isEmpty {
            let count = queue.count
            var sum = 0;
            
            for i in 0..<count {
                let node:TreeNode = queue.removeFirst();
                sum += node.val
               
                if let left : TreeNode = node.left {
                    queue.append(left)
                }
                
                if let right : TreeNode = node.right {
                    queue.append(right)
                }
                
            }
            result.append(Double(sum)/Double(count))

        }
        return result;
    }
}
