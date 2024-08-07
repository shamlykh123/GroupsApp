//
//  GroupsInfo+CoreDataProperties.swift
//  Groups
//
//  Created by Shamly on 07/08/24.
//
//

import Foundation
import CoreData


extension GroupsInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupsInfo> {
        return NSFetchRequest<GroupsInfo>(entityName: "GroupsInfo")
    }

    @NSManaged public var bio: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var participantCount: Int32
    @NSManaged public var groupPrivate: Bool
    @NSManaged public var userStatus: String?
    @NSManaged public var groupPhoto: String?

}

extension GroupsInfo : Identifiable {

}
