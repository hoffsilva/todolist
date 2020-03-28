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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
}

