//
//  781-RabbitsInForest.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/4.
//

import Foundation

/**
 森林中，每个兔子都有颜色。其中一些兔子（可能是全部）告诉你还有多少其他的兔子和自己有相同的颜色。我们将这些回答放在 answers 数组里。

 返回森林中兔子的最少数量。

 示例:
 输入: answers = [1, 1, 2]
 输出: 5
 解释:
 两只回答了 "1" 的兔子可能有相同的颜色，设为红色。
 之后回答了 "2" 的兔子不会是红色，否则他们的回答会相互矛盾。
 设回答了 "2" 的兔子为蓝色。
 此外，森林中还应有另外 2 只蓝色兔子的回答没有包含在数组中。
 因此森林中兔子的最少数量是 5: 3 只回答的和 2 只没有回答的。

 输入: answers = [10, 10, 10]
 输出: 11

 输入: answers = []
 输出: 0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rabbits-in-forest
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 结题思路
// 如果有10只兔子回答5,那么首先定义有个兔子为红色,那么最少有6只红色,剩下4只兔子中有个兔子为蓝色,那么最少有6只蓝色,为了求得最少兔子,假定所有兔子都回答了.那么最少兔子数量应该为12只.
// 可得公式:当有x只兔子都回答y,那么最少数量兔子应该为 ceil(x/(y+1)) * (y+1)

// 使用map来记录

class RabbitsInForest {
    func numRabbits(_ answers: [Int]) -> Int {
        var map : [Int:Int] = [Int:Int]()
        
        for item in answers {
            if map[item] == nil {
                map[item] = 1
            }else{
                map[item] = map[item]! + 1
            }
        }
        
        var ans = 0
        // 计算兔子数量
        for (key,value) in map {
            ans = ans + Int(ceil(Double(value) / Double(key + 1))) * (key + 1)
        }
        return ans
    }
}
