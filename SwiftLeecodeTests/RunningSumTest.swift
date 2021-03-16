//
//  RunningSumTest.swift
//  SwiftLeecodeTests
//
//  Created by BrefChan on 2021/3/16.
//

import XCTest
@testable import SwiftLeecode


class RunningSumTest: XCTestCase {

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRunningSum() throws {
        // input [3,1,2,10,1]
        // output [3,4,6,16,17]
        let result = RunningSum.runningSum([3,1,2,10,1]);
        XCTAssert((result[0] == 3 && result[1] == 4 && result[2] == 6 && result[3] == 16 && result[4] == 17),"一位数组的动态和测试未通过")

    }

}
