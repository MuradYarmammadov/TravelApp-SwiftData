//
//  TravelApp_SwiftUIApp.swift
//  TravelApp SwiftUI
//
//  Created by Murad Yarmamedov on 07.01.24.
//

import SwiftUI
import SwiftData

@main
struct TravelApp_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DestinationModel.self)
    }
}
