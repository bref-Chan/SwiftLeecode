//
//  80-RemoveDuplicatesFromSortedArray2.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/6.
//

import Foundation

/**
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 最多出现两次 ，返回删除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

  

 说明：

 为什么返回数值是整数，但输出的答案是数组呢？

 请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

 你可以想象内部操作如下:

 // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
 int len = removeDuplicates(nums);

 // 在函数里修改输入数组对于调用者是可见的。
 // 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
 for (int i = 0; i < len; i++) {
     print(nums[i]);
 }

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class RemoveDuplicatesFromSortedArray2{
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        //方法1: 快慢指针
//        if nums.count < 3 {
//            return nums.count
//        }
//
//        // 使用快慢指针
//        var p = 0
//        var q = 1
//
//        while q < nums.count {
//            if nums[q] != nums[p] {
//                p = q
//            }else{
//                if q >= (p + 2) {
//                    nums.remove(at: q)
//                    q = q - 1
//                }
//            }
//            q = q + 1;
//        }
//        return nums.count
        
        // 方法2:使用迭代,因为数组为有序数组且可重复数字不能大于2,可以证得:nums[i+2] > nums[i]
        // 利用这个公式,可以创建一个下标i来标记正确的数字应该在的位置,然后遍历数组,把符合条件的数字直接赋值给nums[i],利用数组特性,可以取得更高的效率
        
        if nums.count < 3 {
            return nums.count
        }
        
        var i = 0
        
        for num in nums {
            if (i < 2) || num > nums[i-2] {
                nums[i] = num
                i+=1
            }
        }
        nums[i...] = []
        return nums.count
    }
}
