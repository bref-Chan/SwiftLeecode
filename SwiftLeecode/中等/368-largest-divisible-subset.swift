//
//  368-largest-divisible-subset.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/23.
//

import Foundation

/**
 给你一个由 无重复 正整数组成的集合 nums ，请你找出并返回其中最大的整除子集 answer ，子集中每一元素对 (answer[i], answer[j]) 都应当满足：
 answer[i] % answer[j] == 0 ，或
 answer[j] % answer[i] == 0
 如果存在多个有效解子集，返回其中任何一个均可。

  

 示例 1：

 输入：nums = [1,2,3]
 输出：[1,2]
 解释：[1,3] 也会被视为正确答案。
 示例 2：

 输入：nums = [1,2,4,8]
 输出：[1,2,4,8]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/largest-divisible-subset
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class LargestDivisibleSubset{
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        // 动态规划
        // 状态转移方程
        // 如果一个数可以将一个整除子集里最大的数整除,那么这个数加入到这个整除子集当中,或者一个数可以被一个整除子集里最小的数整除,那么也可以加入到这个整除子集中
        // 状态定义:dp[i]表示在数组为升序排列时,nums[i]为整除子集中最大值时,子集中的元素数量
        // 状态转移方程:枚举j=0...i-1,如果nums[j]可以被整除nums[i],那么dp[i] = dp[i]+1
        // 初始化:由于nums[i]必须被选择,对于任意i=0...i-1,dp[0] = 1
        
        if nums.count <= 1{
            return nums
        }
        
        var sortNums = nums
        sortNums.sort()
        var dp = Array(repeating: 1, count: nums.count)
        dp[0] = 1
        
        // 取出dp中最大的值
        var maxSize = 1
        var maxVal = 1
        for i in 1...sortNums.count-1 {
            
            for j in 0...i-1 {
                if(sortNums[i] % sortNums[j] == 0){
                    dp[i] = max(dp[i],dp[j]+1)
                }
            }
            if dp[i] > maxSize {
                maxSize = dp[i]
                maxVal = sortNums[i]
            }
        }
        
        
        
       var result = [Int]()
        
        if maxSize == 1 {
            result.append(nums[0])
            return result
        }
        
        for i in (0...sortNums.count - 1).reversed() {
            if maxSize == 0 {
                break
            }
            
            if dp[i] == maxSize && maxVal % sortNums[i]  == 0{
                maxSize-=1
                maxVal = sortNums[i]
                result.append(maxVal)
            }
        }
        
        
        return result.reversed()
    }
}
