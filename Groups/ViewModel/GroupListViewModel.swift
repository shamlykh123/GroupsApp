//
//  GroupListViewModel.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import UIKit
import CoreData

@MainActor
class GroupListViewModel: ObservableObject {
    @Published var groupList : GroupListData?
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    /// Get group list from server
    func getGroupList() async{
        do {
            if  let list = try await APIHandler().getGroups(url: Urls.groupListUrl.url) {
                groupList = list
                saveGroupsToDatabase(groupList: list)
            }
        } catch {
            print(error)
        }
    }
    
    /// Save groups info to coredata
    /// - Parameter groupList: group list
    func saveGroupsToDatabase(groupList : GroupListData) {
        
        groupList.result.groups.forEach { group in
            let groupEntity = GroupsInfo(context: context)
            groupEntity.name = group.name
            groupEntity.id = Int32(group.id)
            groupEntity.bio = group.bio
            groupEntity.groupPrivate = group.groupPrivate
            groupEntity.groupPhoto = group.groupPhoto
            groupEntity.participantCount = Int32(group.participantCount)
            groupEntity.userStatus = group.userStatus
            do {
                try context.save()
            } catch {
                print("Error \(error)")
            }
        }
        
    }
    
}
