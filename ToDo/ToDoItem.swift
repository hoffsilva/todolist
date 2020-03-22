//
//  ToDoItem.swift
//  ToDo
//
//  Created by Hoff Henry Pereira da Silva on 19/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
    
    static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        if lhs.location != rhs.location {
            return false
        }
        
        if lhs.timestamp != rhs.timestamp {
            return false
        }
        
        if lhs.description != rhs.description {
            return false
        }
        
        if lhs.title != rhs.title {
            return false
        }
        
        return true
    }
    
    var title: String
    var description: String?
    var timestamp: Double?
    var location: Location?
    
    init(title: String,
         description: String? = nil,
         timestamp: Double? = nil,
         location: Location? = nil) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }
}
