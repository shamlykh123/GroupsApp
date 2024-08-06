//
//  NavView.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import Foundation
import SwiftUI

struct NavView<Content>: View where Content: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let title: String
    let content: Content
    let isDetail: Bool
    let isAdmin: Bool
    let didTapEdit: (() -> Void)
    var body: some View {
        NavigationView {
            VStack {
                NavBar(didTapBack: {
                    presentationMode.wrappedValue.dismiss()
                }, didTapEdit: {
                    if isDetail {
                        self.didTapEdit()
                    }
                }, navTitle: "Back",
                       isDetail: isDetail, isAdmin: isAdmin)
                content
            }
            .background(Color(0x5C95FF))
        }
    }
}
