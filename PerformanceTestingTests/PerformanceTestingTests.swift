//
//  PerformanceTestingTests.swift
//  PerformanceTestingTests
//
//  Created by Peter de Tagyos on 1/18/20.
//  Copyright © 2020 Peter de Tagyos. All rights reserved.
//

import XCTest
@testable import PerformanceTesting

class PerformanceTestingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        let vc = ViewController()
        self.measureMetrics([XCTPerformanceMetric.wallClockTime], automaticallyStartMeasuring: false) {
            let exp = expectation(description: "async")
            self.startMeasuring()
            vc.longRunningTask(delay: 1) {
                self.stopMeasuring()
                exp.fulfill()
            }
            wait(for: [exp], timeout: 3)
        }
    }

}
