//
//  TaskAppApp.swift
//  TaskApp
//
//  Created by Togay Aytemiz on 18.04.2021.
//

import SwiftUI

@main
struct TaskAppApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @StateObject private var store = Store()
    
//    @Environment(\.managedObjectContext) var context

    let obj = observed()
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding == true {
                OnboardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    
                    
            } else {
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .preferredColorScheme(isDarkMode ? .dark : .light)
                    .environmentObject(obj)
                    .environmentObject(store)
                    
            }
    

        }
    }
    
    
}
