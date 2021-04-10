//
//  154-ind-minimum-in-rotated-sorted-array-ii.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/10.
//

import Foundation

/**
 已知一个长度为 n 的数组，预先按照升序排列，经由 1 到 n 次 旋转 后，得到输入数组。例如，原数组 nums = [0,1,4,4,5,6,7] 在变化后可能得到：
 若旋转 4 次，则可以得到 [4,5,6,7,0,1,4]
 若旋转 7 次，则可以得到 [0,1,4,4,5,6,7]
 注意，数组 [a[0], a[1], a[2], ..., a[n-1]] 旋转一次 的结果为数组 [a[n-1], a[0], a[1], a[2], ..., a[n-2]] 。

 给你一个可能存在 重复 元素值的数组 nums ，它原来是一个升序排列的数组，并按上述情形进行了多次旋转。请你找出并返回数组中的 最小元素 。

  

 示例 1：

 输入：nums = [1,3,5]
 输出：1
 示例 2：

 输入：nums = [2,2,2,0,1]
 输出：0


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class IndMinimumInRotatedSortedArray2{
    func findMin(_ nums: [Int]) -> Int {
            for (index,number) in nums.enumerated() {
                var count = 1
                var before = getBefore(index,nums.count)
                repeat {
                    if count == nums.count {return nums[count-1]}
                    if nums[index] < nums[before]{return nums[index]}
                    else if nums[index] > nums[before] {continue}
                    else{
                       before = getBefore(before,nums.count)
                       count += 1
                    }
                } while nums[index] == nums[before]
            }
            return -1
        }

    func getBefore(_ num : Int,_ length : Int) ->Int {
        if num == 0 {return length - 1}
        return num - 1
    }
}
