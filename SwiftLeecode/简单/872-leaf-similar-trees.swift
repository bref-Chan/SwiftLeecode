//
//  872-leaf-similar-trees.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/5/10.
//

import Foundation

class LeafSimilarTrees{
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var root1Array = [Int]()
        var root2Array = [Int]()
        
        loop(root1, &root1Array)
        loop(root2, &root2Array)
        
        if root1Array.count == root2Array.count {
            for i in 0..<root1Array.count {
                if root1Array[i] != root2Array[i] {
                    return false
                }
            }
            return true;
        }else{
            return false;
        }
        
    }

    func loop(_ node:TreeNode?,_ nodeArray: inout [Int]){
        if(node == nil){
            return
        }
        
        if(node!.left == nil && node!.right == nil){
            nodeArray.append(node!.val)
        }
        
        if node!.left != nil {
            loop(node!.left,&nodeArray)
        }
        if node!.right != nil {
            loop(node!.right, &nodeArray)
        }
    }
}
