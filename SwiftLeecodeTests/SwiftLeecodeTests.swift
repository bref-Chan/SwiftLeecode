//
//  SwiftLeecodeTests.swift
//  SwiftLeecodeTests
//
//  Created by BrefChan on 2021/3/15.
//

import XCTest
@testable import SwiftLeecode

class SwiftLeecodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testTowSum() throws {
        var nums : [Int] = [2,7,11,15];
        var target = 9;
        var result = TwoNumber.twoSum(nums, target)
        
        var testResult = 0;
        for (index,number) in result.enumerated() {
            testResult += number;
        }
        XCTAssert(testResult == target,"两数之和测试未通过")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


