//
//  UserResponse+CoreDataProperties.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//
//

import Foundation
import CoreData


extension UserResponse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserResponse> {
        return NSFetchRequest<UserResponse>(entityName: "UserResponse")
    }

    @NSManaged public var date: Date?
    @NSManaged public var note: String?

}

extension UserResponse : Identifiable {

}
