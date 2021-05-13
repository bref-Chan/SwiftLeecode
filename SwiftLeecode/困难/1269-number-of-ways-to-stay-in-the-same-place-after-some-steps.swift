//
//  1269-number-of-ways-to-stay-in-the-same-place-after-some-steps.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/5/13.
//

import Foundation
/**
 有一个长度为 arrLen 的数组，开始有一个指针在索引 0 处。

 每一步操作中，你可以将指针向左或向右移动 1 步，或者停在原地（指针不能被移动到数组范围外）。

 给你两个整数 steps 和 arrLen ，请你计算并返回：在恰好执行 steps 次操作以后，指针仍然指向索引 0 处的方案数。

 由于答案可能会很大，请返回方案数 模 10^9 + 7 后的结果。

  

 示例 1：

 输入：steps = 3, arrLen = 2
 输出：4
 解释：3 步后，总共有 4 种不同的方法可以停在索引 0 处。
 向右，向左，不动
 不动，向右，向左
 向右，不动，向左
 不动，不动，不动
 示例  2：

 输入：steps = 2, arrLen = 4
 输出：2
 解释：2 步后，总共有 2 种不同的方法可以停在索引 0 处。
 向右，向左
 不动，不动
 示例 3：

 输入：steps = 4, arrLen = 2
 输出：8
  

 提示：

 1 <= steps <= 500
 1 <= arrLen <= 10^6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-ways-to-stay-in-the-same-place-after-some-steps
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class NumberOfWaysToStayInTheSamePlaceAfterSOmeSteps{
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        // 动态规划走起
        // 用dp[i][j]来表明第i步到达j下标时的方案数
        // 因为初始状态下标为0,即说明不做任何操作时,下标一定为1,所以dp[0][0] = 1
        // 确定i,j范围,i的范围为[0,steps],j的范围[0,min(arrLen.count-1,steps)]
        // 状态转移方程为:
        // 情况一共有3种:原地停留,从左边移动到右边,从右边移动到左边
        // dp[i][j] = dp[i-1][j] + dp[i-1][j-1] + dp[i-1][j+1],按照题意,需要对最后的结果模10^9 + 7
    
        
        
        let MODULO =  1000000007;

        let maxColumn = min(steps,arrLen-1) ;

        var dp : [Int] = Array(repeating: 0, count: maxColumn + 1)

        dp[0] = 1;

        for _ in 1...steps {
            var nextDp = Array(repeating: 0, count: maxColumn + 1)

            for j in 0...maxColumn {
                nextDp[j] = dp[j];
                if j-1 >= 0 {
                    nextDp[j] = (nextDp[j] + dp[j-1]) % MODULO
                }

                if j+1 <= maxColumn {
                    nextDp[j] = (nextDp[j] + dp[j+1]) % MODULO
                }
            }
            dp = nextDp;
        }

        return dp[0]
    }
}
