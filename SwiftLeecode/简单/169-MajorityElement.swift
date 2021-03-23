//
//  169-MajorityElement.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/23.
//

import Foundation

/**
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

  

 示例 1：

 输入：[3,2,3]
 输出：3
 示例 2：

 输入：[2,2,1,1,1,2,2]
 输出：2

 
 */
class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {
        // 第一种方法:利用hashmap来记录元素出现的次数
        var dict : [Int:Int] = [Int:Int]()
        for item in nums {
            if dict[item] == nil {
                dict[item] = 1;
            }else{
                dict[item] = dict[item]! + 1
            }
            if dict[item]! * 2 >= nums.count {
                return item;
            }
        }
        return nums[0];
        
        // 第二种方法,利用排序,因为多数元素在数组中出现的次数大于[n/2]的元素,所以排序后的数组中,最中间的元素一定就是多数元素
        return nums.sorted()[nums.count / 2]
    }
}
