//
//  33-SearchInRotatedSortedArray.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/7.
//

import Foundation

/**
 整数数组 nums 按升序排列，数组中的值 互不相同 。
 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。

 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class SearchInRotatedSortedArray{
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 核心是使用二分查找,那么查找出来的两部分中一定有一部分是有序的
        // 另外一部分时无序的,对这一部分再次二分,那么也肯定有一部分是有序的另一部分是无序的
        // 通过比较几个端点的大小可以判断出是左边有序还是右边有序
        return binarySearch(left: 0, right: nums.count-1, nums: nums, target: target)
    }
    
    func binarySearch(left:Int,right:Int,nums:[Int],target:Int) ->Int{
        if left>right {
            return -1
        }
        
        let mid : Int = left + (right-left) >> 1
        
        if nums[mid] == target {
            return mid
        }
        
        // 这个小于等于非常精妙.
        // 对于大部分情况来说,用小于可以解决问题,但当left和right相差为1时,因为(right-left) >> 1会向下取整,会导致mid和left相等的情况,这种情况左边相当于已经遍历左边所有了.此时应该向右边遍历.如果不用小于等于而是用小于,target会继续向左查找,导致查询结束
        if nums[left] <= nums[mid] {
            //左边是有序的
            if target < nums[mid] && target >= nums[left] {
                //在左边继续二分
                return binarySearch(left: left, right: mid-1, nums: nums, target: target)
            }else{
                //在右边继续二分
                return binarySearch(left: mid+1, right: right, nums: nums, target: target)
            }
        }else{
            //右边是有序的
            if target > nums[mid] && target <= nums[right] {
                // 在右边查找
                return binarySearch(left: mid+1, right: right, nums: nums, target: target)
            }else{
                // 在左边查找
                return binarySearch(left: left, right: mid-1, nums: nums, target: target)
            }
        }
    }
}
