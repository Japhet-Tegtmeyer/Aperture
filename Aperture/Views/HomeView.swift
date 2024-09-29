//
//  HomeView.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Bindable var user: User
    @State private var isSettingsShowing = false
    @State private var isWallpaperShowing = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Welcome \(user.name)")
                }
            }
        }
        .navigationTitle("Wallpapers")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                TopBarButton(action: {
                    isSettingsShowing.toggle()
                }, symbol: "gearshape.fill")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                TopBarButton(action: {
                    isWallpaperShowing.toggle()
                }, symbol: "plus")
                .font(.caption)
                .fontWeight(.medium)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                TopBarButton(action: {
                   
                }, symbol: "ellipsis")
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let example = User(id: UUID(), name: "John", email: "john@example.com", wallpapers: [], creationDate: Date(), signedUpForNewsletter: false, hasCompletedOnboarding: false)
        return HomeView(user: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
