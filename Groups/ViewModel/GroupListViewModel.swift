//
//  GroupListViewModel.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import Foundation

@MainActor
class GroupListViewModel: ObservableObject {
    @Published var groupList : GroupListData?

    func getGroupList() async{
        do {
            let list = try await APIHandler().getGroups(url: Urls.groupListUrl.url)
            groupList = list
        } catch {
            print(error)
        }
    }
    
}
