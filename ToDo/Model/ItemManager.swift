//
//  ItemManager.swift
//  ToDo
//
//  Created by Hoff Henry Pereira da Silva on 20/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import Foundation

class ItemManager {
    
    var toDoCount: Int {
        toDoItems.count
    }
    var doneCount: Int {
        doneItems.count
    }
    
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []
    
    func add(_ item: ToDoItem) {
        if toDoItems.contains(item) { return }
        toDoItems.append(item)
    }
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func checkItem(at index: Int) {
        doneItems.append(toDoItems.remove(at: index))
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        doneItems[index]
    }
    
    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}
