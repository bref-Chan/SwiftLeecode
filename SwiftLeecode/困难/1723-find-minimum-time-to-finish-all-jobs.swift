//
//  1723-find-minimum-time-to-finish-all-jobs.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/5/8.
//

import Foundation

class FindMinimumTimeToFinishAllJobs{
    var jobs : [Int]?
    var n : Int?
    var k : Int?
    var ans = 0x3f3f3f3f;
    func minimumTimeRequired(_ _jobs: [Int], _ _k: Int) -> Int {
        jobs = _jobs
        n = jobs?.count
        k = _k
        var sum = Array(repeating: 0, count: k!)
        dfs(0,0, &sum, 0)
        return ans
    }
    
    // u: 当前处理的job, sum[] 工人的分配情况  max当前的最大工作时间  朴素版DFS,会超时
//    func dfs(_ u:Int,_ sum :inout [Int],_ _max:Int){
//        if _max > ans {
//            return
//        }
//
//        if u == n {
//            ans = _max;
//            return
//        }
//
//        for i in 0..<k! {
//            sum[i] = sum[i] + jobs![u]
//            dfs(u+1, &sum, max(sum[i],_max))
//            sum[i] = sum[i] - jobs![u]
//        }
//    }
    
    
    // u: 当前处理的job,sum[] 工人的分配情况, _max 当前的最大工作时间, used:当前分配了多少个工人了
    func dfs(_ u:Int,_ used:Int, _ sum: inout [Int],_ _max:Int){
        if _max > ans {
            return
        }

        if u == n {
            ans = _max;
            return
        }
        
        if used < k! {
            //说明还有未分配的工人
            sum[used] = jobs![u]
            dfs(u+1, used+1, &sum, max(sum[used],_max))
            sum[used] = 0
        }
        
        for i in 0..<used {
            sum[i] = sum[i] + jobs![u]
            dfs(u+1, used, &sum, max(sum[i],_max))
            sum[i] = sum[i] - jobs![u]
        }
        
    }
    
}
