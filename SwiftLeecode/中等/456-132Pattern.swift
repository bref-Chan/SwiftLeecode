//
//  456-132Pattern.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/24.
//

import Foundation

/**
 给你一个整数数组 nums ，数组中共有 n 个整数。132 模式的子序列 由三个整数 nums[i]、nums[j] 和 nums[k] 组成，并同时满足：i < j < k 和 nums[i] < nums[k] < nums[j] 。

 i = 1 , j = 3, k = 2
 
 如果 nums 中存在 132 模式的子序列 ，返回 true ；否则，返回 false 。
*/

class OneThreeTwoPattern {
    static func find132pattern(_ nums: [Int]) -> Bool {
        // 暴力破解
        // 枚举3
//        if nums.count < 3 {
//            return false
//        }
//
//       //创建一个数组用来存储任何位置左边最小的元素
//        var minArray = [Int]()
//        var _min = nums.first
//        for item in nums {
//            if item < _min! {
//                _min = item
//            }
//            minArray.append(_min!)
//        }
//
//        for j in 1..<(nums.count - 1) {
//            if nums[j] > minArray[j] {
//                // 满足部分条件,找寻满足条件k
//                // k>j并且nums[k] < nums[j]
//                for k in (j+1)..<nums.count {
//                    if nums[k] < nums[j] && nums[k] > minArray[j] {
//                        return true;
//                    }
//                }
//            }
//        }
//        return false
        
        // 使用单调栈
         if nums.count < 3 {
             return false
         }
        
        //创建一个数组用来存储任何位置左边最小的元素
         var minArray = [Int]()
         var _min = nums.first
         for item in nums {
             if item < _min! {
                 _min = item
             }
             minArray.append(_min!)
         }
        
        // 创建一个栈来存储符合要求的2
        var stack : [Int] = [Int]()
        
        for j in stride(from: nums.count - 1, through: 0, by: -1) {
            // 如果栈中有数据,并且栈中的数据比minArray[j]小,说明都是不符合要求的数据,弹出,直到符合要求的数据出现
            while !stack.isEmpty && stack.last! <= minArray[j] {
                stack.popLast()
            }
            
            // 如果栈中有数据,并且栈尾的数据比num[j]小,说明132模式成立
            if !stack.isEmpty && stack.last! < nums[j] {
                return true
            }
            
            // 如果都不符合,那么当前栈尾的数据比i大,比num[j]大,将num[j]添加至栈尾,作为最大的值
            stack.append(nums[j])
        }
        
        return false
    }
}
