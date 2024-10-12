//
//  Issue+CoreDataProperties.swift
//  
//
//  Created by Seymen Nadir Elmas on 12.10.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Issue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Issue> {
        return NSFetchRequest<Issue>(entityName: "Issue")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var content: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var modificationDate: Date?
    @NSManaged public var priority: Int16
    @NSManaged public var title: String?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for tags
extension Issue {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension Issue : Identifiable {

}
