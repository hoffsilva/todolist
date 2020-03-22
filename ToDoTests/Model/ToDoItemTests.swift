//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Hoff Henry Pereira da Silva on 19/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import XCTest

@testable import ToDo
class ToDoItemTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo")
    }
    
    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(
            title: "",
            description: "Description")
        XCTAssertEqual(item.description, "Description", "Should set item description!")
    }
    
    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }
    
    func test_InitWhenGivenLocation_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)
        XCTAssertEqual(item.location?.name, "Foo", "should set Location")
    }
    
    func test_Items_WhenOneLocationIsNil_AreNotEqual() {
        var first = ToDoItem(title: "", location: Location(name: "Foo"))
        var second = ToDoItem(title: "", location: nil)
        
        XCTAssertNotEqual(first, second)
        
        first = ToDoItem(title: "", location: nil)
        second = ToDoItem(title: "", location: Location(name: "Foo"))
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTimestampDiffer_AreNotEqual() {
        let first = ToDoItem(title: "", timestamp: 1)
        let second = ToDoItem(title: "", timestamp: 0)
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenDescriptionDiffer_AreNotEqual() {
        let first = ToDoItem(title: "", description: "Bar")
        let second = ToDoItem(title: "", description: "Baz")
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Items_WhenTitleDiffer_AreNotEqual() {
           let first = ToDoItem(title: "Foo")
           let second = ToDoItem(title: "Bar")
           
           XCTAssertNotEqual(first, second)
       }

}
