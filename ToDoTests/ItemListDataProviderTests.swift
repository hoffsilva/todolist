//
//  ItemListDataProviderTests.swift
//  ToDoTests
//
//  Created by Hoff Henry Pereira da Silva on 28/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import XCTest
import UIKit
@testable import ToDo

class ItemListDataProviderTests: XCTestCase {

    var sut: ItemListDataProvider!
    var tableView: UITableView!
    var controller: ItemListViewController!
    var mockTableView: MockTableView!
    
    override func setUp() {
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        mockTableView = MockTableView()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(identifier: "ItemListViewController") as! ItemListViewController
        controller.loadViewIfNeeded()
        tableView = controller.tableView
        tableView.dataSource = sut
        
    }

    func test_NumberOfSections_IsTwo() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func test_NumberOfRows_Sections1_IsToDoCount() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_NumberOfRows_Section2_IsToDoneCount() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        sut.itemManager?.checkItem(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        sut.itemManager?.checkItem(at: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func test_CellForRow_ReturnsItemCell() {
        sut.itemManager?.add(ToDoItem(title: "as"))
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(item: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }
    
    func test_CellForRow_DequeuesCellFromTableView() {
        mockTableView.dataSource = sut
        mockTableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        sut.itemManager?.add(ToDoItem(title: "ItemCellItem"))
        mockTableView.reloadData()
        mockTableView.cellForRow(at: IndexPath(item: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    func test_CellForRow_CallsConfigCell() {
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        mockTableView.dataSource = sut
        let item = ToDoItem(title: "Isa")
        sut.itemManager?.add(item)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as! MockItemCell
        XCTAssertEqual(cell.cactchedItem, item)
    }
    
    func test_CellForRow_Section2_CallsConfigCellWithDoneItem() {
        mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), style: .plain)
        mockTableView.dataSource = sut
        mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        let second = ToDoItem(title: "Bar")
        sut.itemManager?.add(second)
        sut.itemManager?.checkItem(at: 1)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRow(at: IndexPath(item: 0, section: 1)) as! MockItemCell
        XCTAssertEqual(cell.cactchedItem, second)
    }

}

extension ItemListDataProviderTests {
    
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockItemCell: ItemCell {
        var cactchedItem: ToDoItem?
        
        override func configCell(with item: ToDoItem) {
            cactchedItem = item
        }
    }
    
}
