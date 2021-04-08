//
//  81-SearchInRotatedSortedArray2.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/7.
//

import Foundation

/**
 已知存在一个按非降序排列的整数数组 nums ，数组中的值不必互不相同。

 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转 ，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,4,4,5,6,6,7] 在下标 5 处经旋转后可能变为 [4,5,6,6,7,0,1,2,4,4] 。

 给你 旋转后 的数组 nums 和一个整数 target ，请你编写一个函数来判断给定的目标值是否存在于数组中。如果 nums 中存在这个目标值 target ，则返回 true ，否则返回 false 。

  

 示例 1：

 输入：nums = [2,5,6,0,0,1,2], target = 0
 输出：true
 示例 2：

 输入：nums = [2,5,6,0,0,1,2], target = 3
 输出：false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class SearchInRotateSortedArray2{
    func search(_ nums: [Int], _ target: Int) -> Bool {
        //这道题和33题很像,只是数组变为了一个费降序排列的数组,那么就意味着其中会有相同的值,这个会影响判断哪部分是相对有序的,所以需要对这部分进行处理
        return binarySearch(left: 0, right: nums.count - 1, nums: nums, target: target)
    }
    
    func binarySearch(left:Int,right:Int,nums:[Int],target:Int) ->Bool{
        if left>right {
            return false
        }
        
        let mid = left + (right - left) >> 1
        
        if nums[mid] == target {
            return true
        }
        
        // 这里处理重复部分的值
        var midLeft = mid
        var midRight = mid
        
        while nums[mid] == nums[midLeft] {
            
            midLeft-=1
            if midLeft == left-1 {
                break
            }
           
        }
        
        while nums[mid] == nums[midRight] {
            
            midRight+=1
            if midRight == right + 1 {
                break
            }
            
        }
        
        if midLeft == left - 1 && midRight == right + 1 {
            return false
        }else if midLeft == left - 1{
            midLeft = left
        }else if midRight == right + 1{
            midRight = right
        }
        
        //此时中间部分重复的部分已经清楚可以进行比较了
        if nums[left] <= nums[midLeft] {
            // 左边部分有序
            if target <= nums[midLeft] && target >= nums[left] {
                //在左边查找
                return binarySearch(left: left, right: midLeft, nums: nums, target: target)
            }else{
                //在右边查找
                return binarySearch(left: midRight, right: right, nums: nums, target: target)
            }
        }else{
            // 右边部分有序
            if target >= nums[midRight] && target <= nums[right] {
                // 在右边查找
                return binarySearch(left: midRight, right: right, nums: nums, target: target)
            }else{
                // 在左边查找
                return binarySearch(left: left, right: midLeft, nums: nums, target: target)
            }
        }
    }
}
