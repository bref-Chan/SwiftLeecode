//
//  74-SearchA2DMatrix.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/30.
//

import Foundation

/**
 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：

 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-a-2d-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Search2DMatrix{
    var m : Int = 0
    var n : Int = 0
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        //简单方案
//        //先判断在哪一行
//
//        var targetArray : [Int] = [Int]()
//        for i in 0..<matrix.count {
//            let array = matrix[i]
//
//            if target <= array.last! {
//                targetArray = array
//                break
//            }
//        }
//
//        if targetArray.count == 0  {
//            return false
//        }
//
//        // 遍历当前行的数据,找到target的位置
//        return targetArray.contains(target)
        
        //聪明方案,使用二分查找
        if matrix.count == 0 || matrix.first?.count == 0 {
            return false;
        }
        
        m = matrix.count
        n = matrix.first?.count ?? 0
        
        if matrix[m - 1][n - 1] < target {
            return false
        }
        
        var low = 0
        var high = m * n - 1
        
        return search(low, high, target, matrix)
    }
    
    
    func search(_ low:Int,_ high:Int,_ target:Int,_ matrix: [[Int]]) -> Bool {
        if low > high {
            return false
        }
        
        var mid = low + (high - low) >> 1
        var targetM = mid / n
        var targetN = mid % n
        var midTarget = matrix[targetM][targetN]
        
        if target == midTarget {
            return true;
        }else if target > midTarget {
            return search(mid + 1, high, target, matrix)
        }else {
            return search(low, mid - 1, target, matrix)
        }
    }
}
