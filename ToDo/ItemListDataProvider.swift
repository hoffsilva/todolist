//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Hoff Henry Pereira da Silva on 28/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject {
    var itemManager: ItemManager?
}

extension ItemListDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? itemManager?.toDoCount ?? 0 : itemManager?.doneCount ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let section = indexPath.section
        var newItem: ToDoItem!
        if let getItem = itemManager?.item(at: indexPath.row), section == 0 {
            newItem = getItem
        }
        if let doneItem = itemManager?.doneItem(at: indexPath.row), section == 1 {
            newItem = doneItem
        }
        cell.configCell(with: newItem)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
}

