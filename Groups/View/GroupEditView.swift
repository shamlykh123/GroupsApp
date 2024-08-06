//
//  GroupEditView.swift
//  Groups
//
//  Created by Shamly on 05/08/24.
//

import SwiftUI

struct GroupEditView: View {
    @State var profile: Group
    var body: some View {
        NavView(title: "sss", content:
                    VStack {
            ProfileImageView(groupPhotoUrl: profile.groupPhoto)
            GroupDataEditView()
        }
            .background(Color(0x5C95FF)),
                isDetail: true,
                isAdmin: false,
                didTapEdit: {}
        )
    }
}


struct GroupDataEditView: View {
    @State private var groupName: String = ""
    @State private var groupDetailInfo: String = ""

    var body: some View {
        VStack (alignment:.leading){
            Text("Name")
                .foregroundColor(Color(0x5C95FF))
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .font(.system(size: 18))
                .fontWeight(.semibold)
            
            TextField("", text: $groupName)
                .foregroundColor(.black)
            
            Rectangle()
                .background(Color(0xB4B4B4))
                .frame(height: 1)
            HStack() {
                Spacer()
                Text("0/50")
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
            }
            
            Text("About Group")
                .foregroundColor(Color(0x5C95FF))
                .padding(.top, 63)
                .font(.system(size: 18))
                .fontWeight(.semibold)
            TextEditor(text: $groupDetailInfo)
                .padding(.top, 18)
                .frame(width: 332,height: 115)
                .background(Color(0xD9D9D9))
                .opacity(0.3)
                .cornerRadius(10)
                .foregroundColor(.black)
            HStack() {
                Spacer()
                Text("0/200")
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
            }
            HStack(alignment: .center, spacing: 25) {
                Spacer()
                Button(action: {}){
                    Text("Cancel")
                        .padding()
                        .foregroundColor(Color(0xFF5252))
                        .frame(width: 112,height: 47)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(0xFF5252), lineWidth: 1)
                        )
                }
                Button(action: {}){
                    Text("Save")
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 112,height: 47)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                        )
                }
                Spacer()
            }
            .padding(.top, 57)
            Spacer()
        }
        .padding(EdgeInsets(top: 33, leading: 34, bottom: 0, trailing: 33))
        .padding(.top, 33)
        .cornerRadius(50, corners: [.topLeft, .topRight])
        .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
        .background(.white)
    }
}
