//
//  BindingTests.swift
//  BuddyBookTests
//
//  Created by bruno.miguens on 31/01/2018.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import XCTest
@testable import LMVVM

class BindingTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShouldInit() {

        XCTAssertNotNil(Binding(value: 1))
    }

    func testShouldBindAfterInit() {

        let binder = Binding(value: 1)

        binder.bind { value in
            XCTAssertEqual(value, 1)
        }
    }

    func testShouldBindAfterSet() {

        var initialized = false
        let binder = Binding(value: 1)

        binder.bind { value in
            if !initialized {
                XCTAssertEqual(value, 1)
            } else {
                XCTAssertEqual(value, 10)
            }
        }

        initialized = true
        binder.value = 10
    }

}
