//
//  DogEncyclopaediaApp.swift
//  DogEncyclopaedia
//
//  Created by Long Hei Au on 2/4/2022.
//

import SwiftUI

@main
struct DogEncyclopaediaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
