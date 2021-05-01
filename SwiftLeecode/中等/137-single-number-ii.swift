//
//  137-single-number-ii.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/30.
//

import Foundation

/**
 给你一个整数数组 nums ，除某个元素仅出现 一次 外，其余每个元素都恰出现 三次 。请你找出并返回那个只出现了一次的元素。

  

 示例 1：

 输入：nums = [2,2,3,2]
 输出：3
 示例 2：

 输入：nums = [0,1,0,1,0,1,99]
 输出：99
  

 提示：

 1 <= nums.length <= 3 * 104
 -231 <= nums[i] <= 231 - 1
 nums 中，除某个元素仅出现 一次 外，其余每个元素都恰出现 三次


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/single-number-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class SingleNumberII{
    func singleNumber(_ nums: [Int]) -> Int {
        // 通过位运算
//        var result = 0
//        for i in 0...63 {
//            var total = 0;
//            for num in nums {
//                total += (num >> i & 1)
//            }
//
//            result |= (total % 3) << i
//        }
//        return result
        
        // 基本方法 使用hashmap
        var dict = [Int:Int]()
        for num in nums {
            if dict[num] == nil {
                dict[num] = 0
            }else{
                dict[num]! += 1
            }
        }
        
        for (key,value) in dict {
            if value == 1 {
                return key;
            }
        }
        return -1;
    }
}


