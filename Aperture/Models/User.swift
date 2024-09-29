//
//  User.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import Foundation
import SwiftData

@Model
final class User {
    var id: UUID
    var name: String
    var email: String
    @Relationship(deleteRule: .cascade) var wallpapers: [Wallpaper]
    var creationDate: Date
    var signedUpForNewsletter: Bool
    var hasCompletedOnboarding: Bool
    
    init(id: UUID, name: String, email: String, wallpapers: [Wallpaper], creationDate: Date, signedUpForNewsletter: Bool, hasCompletedOnboarding: Bool) {
        self.id = id
        self.name = name
        self.email = email
        self.wallpapers = wallpapers
        self.creationDate = creationDate
        self.signedUpForNewsletter = signedUpForNewsletter
        self.hasCompletedOnboarding = hasCompletedOnboarding
    }
}
