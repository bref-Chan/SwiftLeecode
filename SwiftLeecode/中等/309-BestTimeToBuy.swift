//
//  309-BestTimeToBuy.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/19.
//

import Foundation


/**
 题目:
 给定一个整数数组，其中第 i 个元素代表了第 i 天的股票价格 。

 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:

 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
 */


/**
 题解
 
 首先股票只有两种状态,一种是持有,一种是未持有,但是未持有又分为两种情况:一种是一直未持有,第二种是当天卖了所以未持有
 所以总共分为三种状态:
 1.不持股且当天没卖出.设为dp[i][0]
 2.持股. 设为dp[i][1]
 3.不持股且当天卖出了. 设为dp[i][2]
 
 设置初始状态
 dp[0][0] = 0 : 第一天什么都不做
 dp[0][1] = - prices[0] 第一天买了股变为持股状态
 dp[0][2] = 0 : 第一天买入然后马上卖出
 
 状态转移方程:
 新的一天,准备什么都不做,那么可能有两种情况,一种是前一天是不持股且当天没卖出,一种是前一天不持股并且卖出了
 方程:dp[i][0] = max(dp[i-1][0],dp[i-1][2])
 
 新的一天,准备持股,那么也可能有两种情况:一种是前一天就是持股的,一种是前一天不持股并且没有卖出的情况下在今天买入股票
 方程:dp[i][1] = max(dp[i-1][1],dp[i-1][0] - prices[i])
 
 新的一天,准备卖出股票,只有一种情况,前一天一定是持股的.
 方程:dp[i][2] = dp[i-1][1] + price[i]
 */


class BestTimeToBuy{
    static func maxProfit(_ prices:[Int])->Int {
        var states = [[Int]](repeating: [Int](repeating: 0, count: 3), count: prices.count)
        
        // 设置初始条件
        states[0][0] = 0
        states[0][1] = 0 - prices[0]
        states[0][2] = 0;
        
        for i in 1..<(prices.count) {
            states[i][0] = max(states[i-1][0],states[i-1][2])
            states[i][1] = max(states[i-1][1],states[i-1][0]-prices[i])
            states[i][2] = states[i-1][1] + prices[i]
        }
        
        return max(states[prices.count - 1][0],states[prices.count - 1][2])
        
    }
}
