//
//  WelcomeView.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    @Bindable var user: User
    var body: some View {
        NavigationStack {
            ZStack {
                BGGradient()
                
                VStack(spacing: .zero) {
                    Text("Welcome To")
                        .opacity(0.6)
                        .fontWeight(.medium)
                        .padding(.top, 30)
                    
                    Text("Aperture")
                        .font(.system(size: 50, weight: .black))
                        .padding(.top, -10)
                        .fontWidth(.expanded)
                    
                    Spacer()
                    
                    Text("A simple and intuitive way to make modern, beautiful wallpapers")
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 8)
                    
                    Spacer()
                    
                    NavigationLink {
                        InfoView(user: user)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Continue")
                            .bold()
                            .fontWidth(.expanded)
                            .frame(width: 320, height: 50)
                            .background(.ultraThinMaterial.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.bottom, 10)
                    }
                }
                .foregroundStyle(.white)
                .frame(width: 340, height: 250)
                .background(.ultraThinMaterial.opacity(0.2))
                .ignoresSafeArea()
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let example = User(id: UUID(), name: "John", email: "john@example.com", wallpapers: [], creationDate: Date(), signedUpForNewsletter: false, hasCompletedOnboarding: false)
        return WelcomeView(user: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
