//
//  GroupList.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import SwiftUI
import CoreData

struct GroupList: View {
    
    @ObservedObject var viewModel: GroupListViewModel
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(entity: GroupsInfo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \GroupsInfo.id, ascending: true)]) private var grouplistFromStore: FetchedResults<GroupsInfo>
    
    init(viewContext: NSManagedObjectContext) {
        self.viewModel = GroupListViewModel(context: viewContext)
    }
    
    var body: some View {
        NavView(title: "", content:
                    ZStack {
            ScrollView {
                LazyVStack (){
                    Spacer(minLength: 50)
                    ForEach(self.grouplistFromStore, id: \.id) { group in
                        NavigationLink {
                            GroupDetailView(profile: group,isAdmin: group.userStatus?.lowercased() == "admin")
                                .hiddenNavigationBarStyle()
                        } label: {
                            ProfileView(profile: group)
                                .hiddenNavigationBarStyle()
                        }
                        Divider()
                            .background(Color(0xD4D4D4))
                    }
                }
                .background(.white)
                .cornerRadius(50, corners: [.topLeft, .topRight])
            }
            .background(Color(0x5C95FF))
        }, isDetail: false, isAdmin: false, didTapEdit: {})
        .task{
            if self.grouplistFromStore.count == 0 {
                await viewModel.getGroupList()
            }
        }
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
