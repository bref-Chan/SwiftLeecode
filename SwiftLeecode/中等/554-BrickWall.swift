//
//  554-BrickWall.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/5/2.
//

/**
 你的面前有一堵矩形的、由 n 行砖块组成的砖墙。这些砖块高度相同（也就是一个单位高）但是宽度不同。每一行砖块的宽度之和应该相等。

 你现在要画一条 自顶向下 的、穿过 最少 砖块的垂线。如果你画的线只是从砖块的边缘经过，就不算穿过这块砖。你不能沿着墙的两个垂直边缘之一画线，这样显然是没有穿过一块砖的。

 给你一个二维数组 wall ，该数组包含这堵墙的相关信息。其中，wall[i] 是一个代表从左至右每块砖的宽度的数组。你需要找出怎样画才能使这条线 穿过的砖块数量最少 ，并且返回 穿过的砖块数量 。

  

 示例 1：


 输入：wall = [[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]]
 输出：2
 示例 2：

 输入：wall = [[1],[1],[1]]
 输出：3
  
 提示：

 n == wall.length
 1 <= n <= 104
 1 <= wall[i].length <= 104
 1 <= sum(wall[i].length) <= 2 * 104
 对于每一行 i ，sum(wall[i]) 应当是相同的
 1 <= wall[i][j] <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/brick-wall
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class BrickWall {
    func leastBricks(_ wall: [[Int]]) -> Int {
        // 因为沿着边缘是不算穿过砖块的.这个问题可以简化为查找某个位置边缘最多
        // 可以先处理数组,先计算总共有多少个位置可以作为边缘
        var sideCount = 0;
        for num in wall[0]{
            sideCount += num;
        }
        // 计算出来的边缘数量为sideCount - 1
        // 重新构建数组
        
        var resultHashmap = [Int:Int]()
        for (index,wallLine) in wall.enumerated() {
            var sizeIndex = 0;
            for i in 0..<wallLine.count-1 {
                let num = wallLine[i]
                if  resultHashmap[sizeIndex+num-1] == nil {
                    resultHashmap[sizeIndex+num-1] = 1
                }else{
                    resultHashmap[sizeIndex+num-1] = resultHashmap[sizeIndex+num-1]! + 1
                }
                sizeIndex += num
            }
        }
        
        if resultHashmap.values.count == 0 {
            return wall.count
        }else{
            var result = Array.init(resultHashmap.values)
            result.sort()
            return wall.count - result.last!
        }
        
    }
}
