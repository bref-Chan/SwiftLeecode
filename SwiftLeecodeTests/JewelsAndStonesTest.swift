//
//  JewelsAndStonesTest.swift
//  SwiftLeecodeTests
//
//  Created by BrefChan on 2021/3/18.
//

import XCTest
@testable import SwiftLeecode


class JewelsAndStonesTest: XCTestCase {

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

    func testJAS() throws {
        var result = JewelsNStones.numJewelsInStones("aA", "aAAbbbb");
        XCTAssert(result == 3,"宝石与石头测试不通过")

    }
    
}
