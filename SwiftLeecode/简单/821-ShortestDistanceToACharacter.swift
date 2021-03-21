//
//  821-ShortestDistanceToACharacter.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/21.
//


/**
 给你一个字符串 s 和一个字符 c ，且 c 是 s 中出现过的字符。

 返回一个整数数组 answer ，其中 answer.length == s.length 且 answer[i] 是 s 中从下标 i 到离它 最近 的字符 c 的 距离 。

 两个下标 i 和 j 之间的 距离 为 abs(i - j) ，其中 abs 是绝对值函数。
 */

import Foundation

class SDTAC {
    static func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let length = s.count;
        var result = [Int](repeating: 99999, count: length);
        
        var prev : Int = Int.min / 2
        
        for (index,char) in s.enumerated() {
            if char == c {
                prev = index
            }
            result[index] = index - prev
        }
        
        prev = Int.max / 2
        
        for (index,char) in s.enumerated().reversed() {
            if char == c {
                prev = index
            }
            result[index] = min(prev - index ,result[index])
        }
        
        return result;
    }
}
