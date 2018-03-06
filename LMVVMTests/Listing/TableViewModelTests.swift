//
//  TableViewModelTests.swift
//  LMVVMTests
//
//  Created by bruno.miguens on 06/03/2018.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//

import XCTest
@testable import LMVVM

class TableViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldInit() {
        
        let data = DataViewModel<Int>(source: [1, 2, 3])
        let tbModel = TableViewModel<Int, SampleTableCell>(cellIdentifier: "Test", collection: data)
        
        XCTAssertEqual(tbModel.numberOfRows, 3)
    }
    
    func testShouldUpdateCollection() {
        
        let data = DataViewModel<Int>(source: [])
        let tbModel = TableViewModel<Int, SampleTableCell>(cellIdentifier: "Test", collection: data)
        
        XCTAssertEqual(tbModel.numberOfRows, 0)
        
        data.add(object: 1, at: nil)
        data.add(object: 2, at: nil)
        data.add(object: 3, at: nil)
        
        tbModel.update(collection: data)
        
        XCTAssertEqual(tbModel.numberOfRows, 3)
    }
    
    func testShouldUpdateCollectionAndCallBind() {
        
        let data = DataViewModel<Int>(source: [])
        let async = expectation(description: "testShouldUpdateCollectionAndCallBind")
        let tbModel = TableViewModel<Int, SampleTableCell>(cellIdentifier: "Test", collection: data)
        
        XCTAssertEqual(tbModel.numberOfRows, 0)
        
        data.add(object: 1, at: nil)
        data.add(object: 2, at: nil)
        data.add(object: 3, at: nil)
        
        tbModel.bind { model in
            XCTAssertEqual(tbModel.numberOfRows, 3)
            
            async.fulfill()
        }
        
        tbModel.update(collection: data)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testShouldGetCell() {
        
        let table = UITableView()
        table.register(SampleTableCell.self, forCellReuseIdentifier: "Test")
        
        let data = DataViewModel<SampleViewModel>(source: [SampleViewModel(identifier: 1), SampleViewModel(identifier: 2), SampleViewModel(identifier: 3)])
        let tbModel = TableViewModel<SampleViewModel, SampleTableCell>(cellIdentifier: "Test", collection: data)
        
        let cell = tbModel.cell(on: table, at: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell.viewModel?.id, 1)
        XCTAssertEqual(cell.textLabel?.text, "1")
    }
    
}
