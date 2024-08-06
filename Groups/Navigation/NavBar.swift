//
//  NavBar.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import Foundation
import SwiftUI

struct NavBar: View {
    let didTapBack: (() -> Void)
    let didTapEdit: (() -> Void)
    let navTitle: String
    let isDetail: Bool
    let isAdmin: Bool
    var body: some View {
        HStack {
            if isDetail {
                Button(action: {
                    self.didTapBack()
                }, label: {
                    Image(Images.arrow)
                        .resizable()
                        .frame(width: 24,height: 24)
                        .scaledToFit()
                })
                
            } else {
                Text(Constants.groupName.uppercased())
                    .fontWeight(.bold)
                    .font(.system(size: 24))
            }
            Spacer()
            HStack {
                if !isDetail {
                    Button("", systemImage: "magnifyingglass", action: {
                        self.didTapBack()
                    })
                } else  {
                    if isAdmin {
                        Button {
                            self.didTapEdit()
                        } label: {
                            Image(Images.edit)
                                .resizable()
                                .frame(width: 58,height: 22)
                        }
                    }
                }
                Button {
                    print("Image tapped!")
                } label: {
                    Image(Images.hamburger)
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 26, bottom: 0, trailing: 15))
            .foregroundColor(.white)
            .background(Color(0x5C95FF))
    }
}
extension Color {
    init(_ hexColor: UInt32) {
        self.init(uiColor: .init(
                      red: CGFloat(0xFF & (hexColor >> 0x10)) / 0xFF,
                    green: CGFloat(0xFF & (hexColor >> 0x08)) / 0xFF,
                     blue: CGFloat(0xFF & (hexColor >> 0x00)) / 0xFF,
                    alpha: 1.0))
    }
}
