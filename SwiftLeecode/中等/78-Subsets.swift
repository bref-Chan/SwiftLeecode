//
//  78.-Subsets.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/31.
//

import Foundation

class Subsets {
    func subsets(_ nums: [Int]) -> [[Int]] {
        
        // 使用递归:
        // 设定退出条件:当前递归的数组下标与数组长度一致时,返回
        
        // 设定递归函数:取出result里所有数组,给所有数组添加当前target,然后加入一个空数组,然后将新增的数据存入result中
        var result = [[Int]]()
        result.append([])
        bfs(0, nums,&result)
        return result
        
        
    }
    
    func bfs(_ index:Int,_ nums:[Int],_ result :inout [[Int]]) {
        //退出条件
        if(index == nums.count){
            result.append([])

            return

        }
        
        var target = nums[index]
        
        var temp:[[Int]] = result
        
        for i in 0..<temp.count {
            var tempItem = temp[i]
            tempItem.append(target)
            result.append(tempItem)
        }
        
        bfs(index + 1, nums,&result)
 
    }
}
