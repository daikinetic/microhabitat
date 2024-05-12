//
//  microhabitatApp.swift
//  microhabitat
//
//  Created by Daiki Takano on 2024/05/06.
//

import SwiftUI

@main
struct microhabitatApp: App {
  let persistenceController = PersistenceController.shared

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
