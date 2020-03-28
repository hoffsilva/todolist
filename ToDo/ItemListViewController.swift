//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Hoff Henry Pereira da Silva on 19/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet var dataProvider: (UITableViewDelegate & UITableViewDataSource)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.dataSource = dataProvider
        self.tableView?.delegate = dataProvider
    }


}

