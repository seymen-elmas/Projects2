//
//  Tag+CoreDataProperties.swift
//  
//
//  Created by Seymen Nadir Elmas on 12.10.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var issues: NSSet?

}

// MARK: Generated accessors for issues
extension Tag {

    @objc(addIssuesObject:)
    @NSManaged public func addToIssues(_ value: Issue)

    @objc(removeIssuesObject:)
    @NSManaged public func removeFromIssues(_ value: Issue)

    @objc(addIssues:)
    @NSManaged public func addToIssues(_ values: NSSet)

    @objc(removeIssues:)
    @NSManaged public func removeFromIssues(_ values: NSSet)

}

extension Tag : Identifiable {

}
