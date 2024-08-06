//
//  GroupEditView.swift
//  Groups
//
//  Created by Shamly on 05/08/24.
//

import SwiftUI
import Combine

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
    @State private var totalChars = 50
    @State private var totalCharsGroupInfo = 500
    @State private var limitedCountText = "0/50"
    @State private var limitedCountTextForGroupInfo = "0/500"

    var body: some View {
        VStack (alignment:.leading){
            Text("Name")
                .foregroundColor(Color(0x5C95FF))
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                .font(.system(size: 18))
                .fontWeight(.semibold)
            
            TextField("", text: $groupName)
                .foregroundColor(.black)
                .onReceive(Just(groupName)) { _ in limitText(totalChars, labelCount: groupName.count, totalCount: totalChars, updateVar: &groupName) }
            
            Rectangle()
                .background(Color(0xB4B4B4))
                .frame(height: 1)
            HStack() {
                TextField("", text: $limitedCountText)
                    .fixedSize()
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)

            }
           
            Text("About Group")
                .foregroundColor(Color(0x5C95FF))
                .padding(.top, 63)
                .font(.system(size: 18))
                .fontWeight(.semibold)
            TextEditor(text: $groupDetailInfo)
                .padding(.top, 4)
               .frame(width: 332,height: 115)
                .scrollContentBackground(.hidden)
                .background(Color(0xD9D9D9) .opacity(0.3))
                .cornerRadius(10)
                .onReceive(Just(groupDetailInfo)) { _ in limitText(totalCharsGroupInfo, labelCount: groupDetailInfo.count, totalCount: totalCharsGroupInfo, updateVar: &groupDetailInfo) }
        
            HStack() {
                Spacer()
                TextField("", text: $limitedCountTextForGroupInfo)
                    .fixedSize()
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
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
    
    //Function to keep text length in limits
    func limitText(_ upper: Int, labelCount: Int, totalCount: Int, updateVar: inout String) {
        if totalCount == totalChars {
            limitedCountText = "\(labelCount )/\(totalCount)"
        } else {
            limitedCountTextForGroupInfo = "\(labelCount )/\(totalCount)"
        }
        if updateVar.count > upper {
            updateVar = String(updateVar.prefix(upper))
        }
    }
}
