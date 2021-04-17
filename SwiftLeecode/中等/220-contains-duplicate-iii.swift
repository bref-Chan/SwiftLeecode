//
//  220-contains-duplicate-iii.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/4/17.
//

import Foundation

class ContainsDuplicateIII{
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var map = [Int:Int]()
                
        for (index,num) in nums.enumerated() {
            let id = getID(num, t + 1)
            // 因为循环最后会保证map只会保存最近的k个数据,所以直接进行比较就可以了
            // 说明之前有个元素和当前元素在同一个桶内,返回true
            if map.keys.contains(id) {
                return true
            }
            // 与前一个桶比较,这个题的情况其实不存在多个元素都保存在同一个桶的情况,因为这种情况在上面那个判断就返回了
            if let x = map[id-1] , abs(num - x) <= t {
                return true
            }
            // 与后一个桶比较
            if let y = map[id+1] , abs(num - y) <= t {
                return true
            }
            
            // 发现一个新的桶,进行创建
            map.updateValue(num, forKey: id)
            
            // 这里类似于维护一个滑动窗口,只保存K个数据
            if index >= k {
                map.removeValue(forKey: getID(nums[index-k], t+1))
            }
        }
                return false
    }
    private func getID(_ x: Int, _ w: Int) -> Int{
        // 如果x大于0 .直接除以w找到桶的位置,因为是向下取整的
        if x >= 0 {
            return x/w
        }
        // 当x小于0时,通过下面这个方式向下取整
        return (x+1)/w - 1
    }
}
