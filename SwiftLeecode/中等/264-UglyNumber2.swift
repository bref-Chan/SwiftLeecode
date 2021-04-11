//
//  264-UglyNumber2.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/11.
//

import Foundation

/**
 给你一个整数 n ，请你找出并返回第 n 个 丑数 。

 丑数 就是只包含质因数 2、3 和/或 5 的正整数。

  

 示例 1：

 输入：n = 10
 输出：12
 解释：[1, 2, 3, 4, 5, 6, 8, 9, 10, 12] 是由前 10 个丑数组成的序列。
 示例 2：

 输入：n = 1
 输出：1
 解释：1 通常被视为丑数。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ugly-number-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class UglyNumber2 {
    func nthUglyNumber(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n)
        dp[0] = 1
        
        var p2 = 0
        var p3 = 0
        var p5 = 0
        
        for i in 1..<n {
            let v2 = dp[p2] * 2
            let v3 = dp[p3] * 3
            let v5 = dp[p5] * 5
            
            let ugly = min(v2,v3,v5)
            dp[i] =  ugly
            
            if ugly == v2 {
                p2 += 1
            }
            if ugly == v3  {
                p3 += 1
            }
            
            if ugly == v5 {
                p5 += 1
            }
        }
        
        return dp[n-1]
    }
}
