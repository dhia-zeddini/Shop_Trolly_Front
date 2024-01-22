//
//  Shop_TrollyApp.swift
//  Shop_Trolly
//
//  Created by Zeddin Dhia on 22/1/2024.
//

import SwiftUI

@main
struct Shop_TrollyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
