//
//  1310-xor-queries-of-a-subarray.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/5/12.
//

import Foundation

/**
 有一个正整数数组 arr，现给你一个对应的查询数组 queries，其中 queries[i] = [Li, Ri]。

 对于每个查询 i，请你计算从 Li 到 Ri 的 XOR 值（即 arr[Li] xor arr[Li+1] xor ... xor arr[Ri]）作为本次查询的结果。

 并返回一个包含给定查询 queries 所有结果的数组。

  

 示例 1：

 输入：arr = [1,3,4,8], queries = [[0,1],[1,2],[0,3],[3,3]]
 输出：[2,7,14,8]
 解释：
 数组中元素的二进制表示形式是：
 1 = 0001
 3 = 0011
 4 = 0100
 8 = 1000
 查询的 XOR 值为：
 [0,1] = 1 xor 3 = 2
 [1,2] = 3 xor 4 = 7
 [0,3] = 1 xor 3 xor 4 xor 8 = 14
 [3,3] = 8
 示例 2：

 输入：arr = [4,8,2,10], queries = [[2,3],[1,3],[0,0],[0,3]]
 输出：[8,0,4,4]
  

 提示：

 1 <= arr.length <= 3 * 10^4
 1 <= arr[i] <= 10^9
 1 <= queries.length <= 3 * 10^4
 queries[i].length == 2
 0 <= queries[i][0] <= queries[i][1] < arr.length

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/xor-queries-of-a-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class XorQueriesOfASubarray{
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        //该方案超时
        
//        var result = [Int]()
//
//        for array in queries {
//            if array.first == array.last {
//                result.append(arr[array.first!])
//                continue
//            }
//
//            var res = 0;
//            for i in array.first!...array.last! {
//                res = res^arr[i]
//            }
//            result.append(res);
//        }
//
//
//        return result
        
        // 先计算前缀和
        var prefixArr = Array(repeating: 0, count: arr.count + 1)
        var prefix = 0
        for i in 1...arr.count {
            prefix = prefix ^ arr[i-1]
            prefixArr[i] = prefix
        }
        
        // 0100 1000 0010 1010
        // 0000 0100 1100 1110 0100
        
        // [2,3] => 1000
            
        
        var result = [Int]()
        for item in queries {
            if item.first == item.last {
                result.append(arr[item.first!])
                continue
            }
            
            result.append((prefixArr[item.last!+1]^prefixArr[item.first!]))
        }
        
        
        return result
    }
}
