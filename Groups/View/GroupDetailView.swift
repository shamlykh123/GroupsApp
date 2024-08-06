//
//  GroupDetailView.swift
//  Groups
//
//  Created by Shamly on 05/08/24.
//

import SwiftUI

struct GroupDetailView: View {
    @State var profile: Group
    @State var showEditView: Bool = false
    @State var isAdmin: Bool = false
    
    var body: some View {
        NavView(title: "", content:
                    VStack {
            NavigationLink(
                destination: GroupEditView(profile: profile)
                    .hiddenNavigationBarStyle()
                
                ,
                isActive: $showEditView
            ) {
                EmptyView()
            }
            ProfileImageView(groupPhotoUrl: profile.groupPhoto)
                .padding(.top, 34)
            VStack (spacing: 4){
                Text(profile.name)
                    .padding(.top, 14)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text(profile.name)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            HStack(spacing: 2) {
                Image(Images.users)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                Text("\(profile.participantCount)")
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
            }
            .background(Color(0x5C95FF))
            VStack {
                Text("About Group")
                    .padding(EdgeInsets(top: 44, leading: 34, bottom: 0, trailing: 246))
                    .foregroundColor(Color(0x5C95FF))
                HStack {
                    Text(profile.bio)
                        .padding(EdgeInsets(top: 10, leading: 49, bottom: 0, trailing: 47))
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                        .opacity(0.6)
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 14)
            .cornerRadius(50, corners: [.topLeft, .topRight])
            .frame(maxHeight: .infinity)
            .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
            .background(.white)
        }
            .background(Color(0x5C95FF)),
                isDetail: true,
                isAdmin: isAdmin ,
                didTapEdit: {
            showEditView = true
        }
        )
    }
}
