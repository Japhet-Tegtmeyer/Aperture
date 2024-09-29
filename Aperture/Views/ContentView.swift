//
//  ContentView.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var users: [User]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Group {
            if let user = users.first {
                if user.hasCompletedOnboarding {
                    HomeView(user: user)
                } else {
                    WelcomeView(user: user)
                }
            } else {
                WelcomeView(user: createNewUser())
            }
        }
    }
    
    private func createNewUser() -> User {
        let newUser = User(id: UUID(), name: "", email: "", wallpapers: [], creationDate: Date(), signedUpForNewsletter: false, hasCompletedOnboarding: false)
        modelContext.insert(newUser)
        return newUser
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [User.self, Wallpaper.self], inMemory: true)
}
