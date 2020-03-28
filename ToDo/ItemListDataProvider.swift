//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Hoff Henry Pereira da Silva on 28/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject {

}

extension ItemListDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}
