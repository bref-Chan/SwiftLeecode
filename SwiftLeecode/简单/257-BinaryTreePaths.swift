//
//  257-BinaryTreePaths.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/29.
//

import Foundation

/**
 给定一个二叉树，返回所有从根节点到叶子节点的路径。

 说明: 叶子节点是指没有子节点的节点。

 示例:

 输入:

    1
  /   \
 2     3
  \
   5

 输出: ["1->2->5", "1->3"]

 解释: 所有根节点到叶子节点的路径为: 1->2->5, 1->3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-paths
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class BinaryTreePath {
    var strings : [String] = [String]()
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if root == nil {
            return []
        }
        
        path(root,"")
        return strings
    }
    
    func path(_ root: TreeNode?,_ s : String) {
        let tempString = s + "\(root!.val)"
        //写出返回条件
        if root?.left == nil && root?.right == nil {
            strings.append(tempString)
            return;
        }
        
        if root?.left != nil {
            path(root?.left, tempString + "->")
        }
        
        if root?.right != nil {
            path(root?.right, tempString + "->")
        }
    }
}

