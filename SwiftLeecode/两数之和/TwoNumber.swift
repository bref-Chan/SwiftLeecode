//
//  TwoNumber.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/15.
//

import Foundation

class TwoNumber {
    static func twoSum(_ nums : [Int], _ target:Int) -> [Int] {
        var dict : [Int:Int] = [:]
        for (index,number) in nums.enumerated() {
            let remainder = target - number
            
            if(dict.keys.contains(remainder)){
                if let remainderIndex : Int = dict[remainder],remainderIndex != index{
                    return [index,remainderIndex]
                }
            }
            dict[number] = index;
        }
        return [];
        
      

    }
}
