//
//  1431-KidsWithTheGreatestNumberOfCandies.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/18.
//

/**
 给你一个数组 candies 和一个整数 extraCandies ，其中 candies[i] 代表第 i 个孩子拥有的糖果数目。

 对每一个孩子，检查是否存在一种方案，将额外的 extraCandies 个糖果分配给孩子们之后，此孩子有 最多 的糖果。注意，允许有多个孩子同时拥有 最多 的糖果数目。
 */

import Foundation

class Kids {
    static func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max()!
       
        
        var result = [Bool]()
        for item in candies {
            if item + extraCandies >= max {
                result.append(true)
            }else{
                result.append(false)
            }
        }
        
        return result
    }
}
