//
//  List+CoreDataProperties.swift
//  TodoListApp
//
//  Created by Musa Adıtepe on 7.08.2024.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var title: String?

}

extension List : Identifiable {

}
