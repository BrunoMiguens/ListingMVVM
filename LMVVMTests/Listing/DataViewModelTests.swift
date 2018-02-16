//
//  DataViewModelTests.swift
//  BuddyBookTests
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 31/01/18.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import XCTest
@testable import LMVVM

class DataViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShouldInit() {
        XCTAssertNotNil(DataViewModel(source: []))
    }

    func testShouldGetCount() {

        let model = DataViewModel(source: [1])

        XCTAssertEqual(model.count, 1)
    }

    func testShouldAppend() {

        let model = DataViewModel(source: [1])

        model.add(object: 2, at: nil)

        XCTAssertEqual(model.count, 2)
        XCTAssertEqual(model.index(of: 0), 1)
        XCTAssertEqual(model.index(of: 1), 2)

        model.add(object: 3, at: 10)

        XCTAssertEqual(model.count, 3)
        XCTAssertEqual(model.index(of: 0), 1)
        XCTAssertEqual(model.index(of: 1), 2)
        XCTAssertEqual(model.index(of: 2), 3)

        model.add(object: 4, at: -1)

        XCTAssertEqual(model.count, 4)
        XCTAssertEqual(model.index(of: 0), 1)
        XCTAssertEqual(model.index(of: 1), 2)
        XCTAssertEqual(model.index(of: 2), 3)
        XCTAssertEqual(model.index(of: 3), 4)
    }

    func testShouldInsert() {

        let model = DataViewModel(source: [1])

        model.add(object: 2, at: 0)

        XCTAssertEqual(model.count, 2)
        XCTAssertEqual(model.index(of: 0), 2)
        XCTAssertEqual(model.index(of: 1), 1)
    }

    func testShouldRemove() {

        var model = DataViewModel(source: [1, 2])

        model.remove(at: 1)

        XCTAssertEqual(model.count, 1)
        XCTAssertEqual(model.index(of: 0), 1)

        model = DataViewModel(source: [1, 2])

        model.remove(at: 10)

        XCTAssertEqual(model.count, 2)
        XCTAssertEqual(model.index(of: 0), 1)
        XCTAssertEqual(model.index(of: 1), 2)

        model.remove(at: -1)

        XCTAssertEqual(model.count, 2)
        XCTAssertEqual(model.index(of: 0), 1)
        XCTAssertEqual(model.index(of: 1), 2)
    }

    func testShouldGetIndex() {

        let model = DataViewModel(source: [1, 2])

        XCTAssertEqual(model.index(of: 0), 1)
        XCTAssertEqual(model.index(of: 1), 2)

        XCTAssertEqual(model.count, 2)
    }

    func testShouldNotGetIndex() {

        let model = DataViewModel(source: [1, 2])

        XCTAssertNil(model.index(of: -1))
        XCTAssertNil(model.index(of: 10))

        XCTAssertEqual(model.count, 2)
    }

}
