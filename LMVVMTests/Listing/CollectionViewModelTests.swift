//
//  CollectionViewModelTests.swift
//  LMVVMTests
//
//  Created by bruno.miguens on 06/03/2018.
//  Copyright © 2018 Bruno Miguêns. All rights reserved.
//
import XCTest
@testable import LMVVM

class CollectionViewModelTests: XCTestCase {
    
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
        let clModel = CollectionViewModel<Int, SampleCollectionCell>(cellIdentifier: "Test", data: data)
        
        XCTAssertEqual(clModel.numberOfRows, 3)
    }
    
    func testShouldUpdateCollection() {
        
        let data = DataViewModel<Int>(source: [])
        let clModel = CollectionViewModel<Int, SampleCollectionCell>(cellIdentifier: "Test", data: data)
        
        XCTAssertEqual(clModel.numberOfRows, 0)
        
        data.add(object: 1, at: nil)
        data.add(object: 2, at: nil)
        data.add(object: 3, at: nil)
        
        clModel.update(collection: data)
        
        XCTAssertEqual(clModel.numberOfRows, 3)
    }
    
    func testShouldUpdateCollectionAndCallBind() {
        
        let data = DataViewModel<Int>(source: [])
        let async = expectation(description: "testShouldUpdateCollectionAndCallBind")
        let clModel = CollectionViewModel<Int, SampleCollectionCell>(cellIdentifier: "Test", data: data)
        
        XCTAssertEqual(clModel.numberOfRows, 0)
        
        data.add(object: 1, at: nil)
        data.add(object: 2, at: nil)
        data.add(object: 3, at: nil)
        
        clModel.bind { model in
            XCTAssertEqual(clModel.numberOfRows, 3)
            
            async.fulfill()
        }
        
        clModel.update(collection: data)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
}

