//
//  GroupsApp.swift
//  Groups
//
//  Created by Shamly on 03/08/24.
//

import SwiftUI

@main
struct GroupsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            GroupList(viewContext: persistenceController.container.viewContext)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
