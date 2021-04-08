//
//  153-FindMinimuminRotatedSortedArray.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/8.
//

import Foundation
/**
 已知一个长度为 n 的数组，预先按照升序排列，经由 1 到 n 次 旋转 后，得到输入数组。例如，原数组 nums = [0,1,2,4,5,6,7] 在变化后可能得到：
 若旋转 4 次，则可以得到 [4,5,6,7,0,1,2]
 若旋转 7 次，则可以得到 [0,1,2,4,5,6,7]
 注意，数组 [a[0], a[1], a[2], ..., a[n-1]] 旋转一次 的结果为数组 [a[n-1], a[0], a[1], a[2], ..., a[n-2]] 。

 给你一个元素值 互不相同 的数组 nums ，它原来是一个升序排列的数组，并按上述情形进行了多次旋转。请你找出并返回数组中的 最小元素 。

  

 示例 1：

 输入：nums = [3,4,5,1,2]
 输出：1
 解释：原数组为 [1,2,3,4,5] ，旋转 3 次得到输入数组。
 示例 2：

 输入：nums = [4,5,6,7,0,1,2]
 输出：0
 解释：原数组为 [0,1,2,4,5,6,7] ，旋转 4 次得到输入数组。
 示例 3：

 输入：nums = [11,13,15,17]
 输出：11
 解释：原数组为 [11,13,15,17] ，旋转 4 次得到输入数组。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class FindMinimumRotatedSortedArray{
    func findMin(_ nums: [Int]) -> Int {
        // 最简单的思路,因为原数组是升序数组并且至少经过了1次以上的旋转,所以依次比较如果遇到比前一个数小的数,那么这个数就是最小

        if nums.count == 1 {
            return nums[0]
        }
        
        // 特殊情况,旋转的nums.count的倍数次
        if nums[0] < nums[nums.count-1]{
            return nums[0]
        }

        // 遍历数组,如果当前index的数比前一个数小,那么这个数就是最小元素
        for i in 1..<nums.count {
            if nums[i]<nums[i-1] {
                return nums[i]
            }
        }
        return -1
    }
}
