//
//  AddDigits.swift
//  SwiftLeecode
//
//  Created by BrefChan on 2021/3/18.
//

import Foundation

class AddDigits{
    static func addDigits(_ num: Int) -> Int {
        let strNum : String = String(num)
        var result : Int = 0;
        for item in strNum {
            result  = result + Int(String(item))!
        }
        
        if result > 10 {
           return addDigits(result)
        }else{
            return result
        }
    }
}
