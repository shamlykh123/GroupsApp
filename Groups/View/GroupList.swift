//
//  GroupList.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import SwiftUI

struct GroupList: View {
    @ObservedObject var viewModel: GroupListViewModel
    
    var body: some View {
        NavView(title: "sss", content:
                    ZStack {
            ScrollView {
                LazyVStack (){
                    Spacer(minLength: 50)
                    ForEach(viewModel.groupList?.result.groups ?? [], id: \.id) { group in
                        NavigationLink {
                            GroupDetailView(profile: group,isAdmin: group.userStatus.lowercased() == "admin")
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
            await viewModel.getGroupList()
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
