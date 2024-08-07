//
//  ProfileView.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import SwiftUI

struct ProfileView: View {
    
    var profile: GroupsInfo
    var body: some View {
        HStack( content: {
            VStack {
                AsyncImage(url: URL(string: profile.groupPhoto ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60, alignment: .leading)
                        .cornerRadius(30)
                } placeholder: {
                    ProgressView("Loading...")
                        .frame(maxWidth: 100, maxHeight: 100)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 18, leading: 18, bottom: 0, trailing: 14))
            .cornerRadius(30)
            VStack(alignment: .leading, spacing: 4, content: {
                HStack (spacing: 4){
                    Text(profile.name ?? "")
                        .fontWeight(.semibold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    Text(profile.userStatus?.lowercased() ?? "")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                        .background(Color(0x5C95FF))
                        .cornerRadius(4)
                }
                Text(profile.bio ?? "")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .opacity(0.6)

            })
            Spacer()
            VStack {
                Spacer()
                HStack(spacing: 2) {
                    Image(Images.users)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 20,height: 20)
                    Text("\(profile.participantCount)")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }
                Text("15")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
                    .background(Color(0x5C95FF))
                    .font(.system(size: 12))
                    .cornerRadius(12)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .padding(15)
            
        })
        .frame(maxHeight: .infinity)
        .background(.white)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
