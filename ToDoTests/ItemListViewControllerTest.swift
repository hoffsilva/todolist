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

    func test_TableViewIsNotNilAfterViewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ItemListViewController")
        
        let sut = viewController as! ItemListViewController
        sut.loadViewIfNeeded() // Trigger the call of viewDidLoad()
        XCTAssertNotNil(sut.tableView)
    }

}
