//
//  80-RemoveDuplicatesFromSortedArray2.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/6.
//

import Foundation


class RemoveDuplicatesFromSortedArray2{
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 3 {
            return nums.count
        }
        
        // 使用快慢指针
        var p = 0
        var q = 1

        while q < nums.count {
            if nums[q] != nums[p] {
                p = q
            }else{
                if q >= (p + 2) {
                    nums.remove(at: q)
                    q = q - 1
                }
            }
            q = q + 1;
        }
        return nums.count
    }
}
