//
//  01Package.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/19.
//

import Foundation

/**
 对于一组不同重量、不可分割的物品，我们需要选择一些装入背包，在满足背包最大重量限制的前提下，背包中物品总重量的最大值是多少呢？
 */

class ZeroOnePackage {
    // weight 物品重量 n 物品个数 w:可承载数量
    static func knapsack(_ weights:[Int],_ n : Int, _ w : Int) -> Int{
        var states = [[Bool]](repeating: [Bool](repeating: false, count: w + 1), count: n)
        
        //第一行数据特殊处理
        states[0][0] = true;
        
        if(weights[0] <= w){
            states[0][weights[0]] = true;
            print(states[0])
            print("\n")
        }
        
        //状态转移
        for i in 1..<n{
            //不将第i个物品放入背包(此时应该将上一层状态移入下一层)
            for j in 0..<w+1 {
                states[i][j] = states[i-1][j];
            }
            
            // 将第i个物品放入背包
            for j in 0..<(w-weights[i]+1) {
                if states[i-1][j] == true {
                    states[i][j+weights[i]] = true;
                }
            }
            print(states[i])
            print("\n")
            
        }
        
        // 输出结果
        for i in (0...w).reversed(){
            if states[n-1][i] == true {
                return i;
            }
        }
        
        return 0;
    }
}
