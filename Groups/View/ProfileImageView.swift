//
//  ProfileImageView.swift
//  Groups
//
//  Created by Shamly on 06/08/24.
//

import SwiftUI


struct ProfileImageView: View {
    @State var groupPhotoUrl: String
    var body: some View {
        AsyncImage(url: URL(string: groupPhotoUrl)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .leading)
                .cornerRadius(40)
        } placeholder: {
            ProgressView("Loading...")
                .frame(maxWidth: 100, maxHeight: 100)
        }
    }
}
