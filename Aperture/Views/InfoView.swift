//
//  InfoView.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import SwiftUI
import SwiftData

struct InfoView: View {
    enum FocusedField {
        case name, email
    }
    
    @Bindable var user: User
    @FocusState private var focusedField: FocusedField?
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            ZStack {
                BGGradient()
                    .overlay {
                        Rectangle()
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                            .background(.ultraThinMaterial)
                            .ignoresSafeArea()
                    }
                VStack(alignment: .leading) {
                    Text("Please enter the following info")
                    
                    Text("Name")
                        .font(.subheadline)
                        .padding(.bottom, -5)
                        .padding(.leading, 8)
                        .padding(.top)
                    
                    TextField("", text: $user.name, prompt: Text("Name").foregroundStyle(Color(.systemGray5).opacity(0.5)))
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(.ultraThinMaterial.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.bottom, 8)
                    
                    Text("Email")
                        .font(.subheadline)
                        .padding(.bottom, -5)
                        .padding(.leading, 8)
                    
                    TextField("", text: $user.email, prompt:  Text("Email").foregroundStyle(Color(.systemGray5).opacity(0.5)))
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(.ultraThinMaterial.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.bottom, 8)
                    
                    Toggle(isOn: $user.signedUpForNewsletter) {
                        Text("Do you want to receive emails regarding updates and special events?")
                            .font(.caption)
                    }
                    .toggleStyle(.checkmark)
                    .padding(.horizontal, 8)
                    
                    NavigationLink {
                        HomeView(user: user)
                            .navigationBarBackButtonHidden()
                            .onAppear {
                                user.completeOnboarding()
                                try? modelContext.save()
                            }
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.horizontal, 50)
                            .padding(.top)
                    }
                    .disabled(user.name.isEmpty || user.email.isEmpty)
                       
                    Spacer()
                    
                    Text("This information is needed for the app to function properly")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 32)
                }
                .padding(.horizontal)
                .foregroundStyle(.white)
                .navigationTitle("Info")
                .navigationBarTitleTextColor(.white)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let example = User(id: UUID(), name: "John", email: "john@example.com", wallpapers: [], creationDate: Date(), signedUpForNewsletter: false, hasCompletedOnboarding: false)
        return InfoView(user: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
