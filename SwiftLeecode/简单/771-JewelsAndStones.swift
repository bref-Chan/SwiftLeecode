//
//  JewelsAndStones.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/18.
//

import Foundation


class JewelsNStones {
    static func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        /**
            var hashSet:Set<Character> = Set(jewels)
               var count = 0
               for char in stones {
                 if hashSet.contains(char) {
                   count+=1
                 }
               }
               return count

         */
        
        var count = 0

        for str in stones {
            if jewels.contains(str) {
                count += 1
            }
        }
        return count
    }
}
