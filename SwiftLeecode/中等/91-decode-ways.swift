//
//  91-decode-ways.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/21.
//

import Foundation

/**
 一条包含字母 A-Z 的消息通过以下映射进行了 编码 ：

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 要 解码 已编码的消息，所有数字必须基于上述映射的方法，反向映射回字母（可能有多种方法）。例如，"11106" 可以映射为：

 "AAJF" ，将消息分组为 (1 1 10 6)
 "KJF" ，将消息分组为 (11 10 6)
 注意，消息不能分组为  (1 11 06) ，因为 "06" 不能映射为 "F" ，这是由于 "6" 和 "06" 在映射中并不等价。

 给你一个只含数字的 非空 字符串 s ，请计算并返回 解码 方法的 总数 。

 题目数据保证答案肯定是一个 32 位 的整数。

  

 示例 1：

 输入：s = "12"
 输出：2
 解释：它可以解码为 "AB"（1 2）或者 "L"（12）。
 示例 2：

 输入：s = "226"
 输出：3
 解释：它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
 示例 3：

 输入：s = "0"
 输出：0
 解释：没有字符映射到以 0 开头的数字。
 含有 0 的有效映射是 'J' -> "10" 和 'T'-> "20" 。
 由于没有字符，因此没有有效的方法对此进行解码，因为所有数字都需要映射。
 示例 4：

 输入：s = "06"
 输出：0
 解释："06" 不能映射到 "F" ，因为字符串含有前导 0（"6" 和 "06" 在映射中并不等价）

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/decode-ways
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class DecodeWays{
    func numDecodings(_ s: String) -> Int {
        //使用动态规划
        // 可以将题目简化为判断当前字符是否可以独立解码,判断标志位i字符是否为0
        // ap[i]表示截止s[i]的位置总共有多少中解码总数
        // 第一种:s[i]为0,此时不能独立解码,此时又分两种情况
        //  1.s[i-1]为1或者2,此时可以与前面构成10,20,那么dp[i] == dp[i-2]
        //  2. s[i-1]为1,2之外的数,那么解码字符错误,返回0
        // 第二种:s[i]不为0,此时有三种情况
        // 1. s[i-1]为1,此时s[i]既可以单独解码既可以合并解码,dp[i] = dp[i-1] + dp[i - 2]
        // 2.s[i-1]为2,此时当s[i]小于7,也可以单独解码也可以合并解码 dp[i] = dp[i-1] + dp[i-2]
        // 3.其余的情况,s[i]只能单独解码 dp[i] = dp[i-1]
        
        if s.count == 0 {
            return 0
        }
        
        if String(s.first!) == "0" {
            return 0
        }
        
        if s.count == 1 {
            return 1
        }
        
        let arr = s.map({String($0)})
        let nums = arr.map({Int($0) ?? 0})
        
        let count = nums.count
        
        var dp : [Int] = Array(repeating: 0, count: count)
        dp[0] = 1;
        
        for i in 1...count-1 {
            let current = nums[i]
            if current == 0 {
                if nums[i-1] == 1 || nums[i-1] == 2 {
                    dp[i] = i >= 2 ? dp[i-2] : 1
                }else{
                    return 0
                }
            }else{
                if nums[i-1] == 1 {
                    dp[i] = (i >= 2 ? dp[i-2] : 1) + dp[i-1]
                }else if (nums[i-1] == 2 && current < 7){
                    dp[i] = (i >= 2 ? dp[i-2] : 1) + dp[i-1]
                }else{
                    dp[i] = dp[i-1]
                }
            }
        }
        
        return dp.last!
    }
}
