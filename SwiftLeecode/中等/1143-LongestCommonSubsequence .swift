//
//  1143-LongestCommonSubsequence .swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/3.
//

import Foundation

/**
 
 给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。

 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。

 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。
 两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-common-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 结题思路:
// 使用动态规划:
// 第一步:状态定义:
// 可以定义dp[i][j]来定义text1[0,i-1],text2[0,j-1]的最长公共序列
// 第二步:状态转移方程
// 当text1[i-1] == text2[j-1]时,说明两个子字符串的最后一位相等,所以最长公共子序列又增加了1,所以dp[i][j] = dp[i-1][j-1] + 1
// 当text1[i-1] != text2[j-1]时,说明两个子字符串的最后一位不相等,所以此时的状态dp[i][j]应该是dp[i-1][j]和dp[i-1][j]中的最大值
// 第三步:状态的初始化
// 当i=0,j=0时,dp[i][j]应该取值多少
// 当i=0时,dp[0][j]相当于从text1中取空字符串与text2的最长公共子序列,此时结果为0
// 当j=0时,dp[i][0]相当于从text2中取空字符串与text1的最长公共子序列,此时结果为0
// 所以,当i=0,j=0时,dp[i][j] = 0
// 第四步:遍历方向和范围
// 由于dp[i][j]依赖dp[i-1][j-1],dp[i-1][j]和dp[i][j-1],所以i和j的遍历顺序肯定是从小到大的.
// 另外由于dp[0][0]为0,所以直接让i个j从1开始遍历,遍历的结束应该为字符串的长度text1.length,text2.length
// 最终返回结果:
// 由于dp[i][j]的含义是text1[0:i-1]和text2[0:j-1]的最长公共子序列,我们最终希望求的是text1和text2的最长公共子序列,所以需要返回的结果是i = text1.length,j = text2.length的结果

class LongestCommonSubsequence{
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        // 类型转换
        let textArray1 = Array(text1)
        let textArray2 = Array(text2)
        
        // 创建dp数组,因为初始状态的考虑所以数组的范围为n+1 * m+1
        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        // 此时数组所有的内容都为0,不要再做初始化,直接从1,1开始迭代
        for i in 1...text1.count {
            for j in 1...text2.count {
                // 写状态转移方程
                if textArray1[i-1] == textArray2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                }else{
                    dp[i][j] = max(dp[i][j-1],dp[i-1][j])
                }
                
            }
        }
        
        return dp[text1.count][text2.count]
    }
}


