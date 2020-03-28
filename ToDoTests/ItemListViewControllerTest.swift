//
//  ItemListViewControllerTest.swift
//  ToDoTests
//
//  Created by Hoff Henry Pereira da Silva on 22/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import XCTest

@testable import ToDo

class ItemListViewControllerTest: XCTestCase {
    
    var storyboard: UIStoryboard!
    var viewController: UIViewController!
    var sut: ItemListViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(identifier: "ItemListViewController")
        sut = (viewController as! ItemListViewController)
        sut.loadViewIfNeeded() // Trigger the call of viewDidLoad()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView?.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView?.delegate is ItemListDataProvider)
    }
    
    func test_LoadingView_DataSourceEqualDelegate() {
        let dataSource = sut.tableView?.dataSource is ItemListDataProvider
        let delegate = sut.tableView?.delegate is ItemListDataProvider
        XCTAssertEqual(dataSource, delegate)
    }

}
