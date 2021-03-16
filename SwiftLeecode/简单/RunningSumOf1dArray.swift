//
//  RunningSumOf1dArray.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/16.
//

/**
 给你一个数组 nums 。数组「动态和」的计算公式为：runningSum[i] = sum(nums[0]…nums[i]) 。

 请返回 nums 的动态和。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/running-sum-of-1d-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

import Foundation

class RunningSum {
    static func runningSum(_ nums: [Int]) -> [Int] {
        var temp = nums;
        for i in 1..<nums.count{
            temp[i] += temp[i-1];
        }
        return temp
        
    }
}
