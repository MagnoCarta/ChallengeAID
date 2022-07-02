//
//  ChallengeAIDApp.swift
//  Shared
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//

import SwiftUI

@main
struct ChallengeAIDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HQView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
