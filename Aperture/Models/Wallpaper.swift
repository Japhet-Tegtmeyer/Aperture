//
//  Wallpaper.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Wallpaper: Identifiable {
    let id: UUID
    var name: String
    var width: Int
    var height: Int
    var points: [SIMD2<Float>]
    var hexCodes: [String]
    var creationDate: Date
    
    init(id: UUID, name: String, width: Int, height: Int, points: [SIMD2<Float>], hexCodes: [String], creationDate: Date) {
        self.id = id
        self.name = name
        self.width = width
        self.height = height
        self.points = points
        self.hexCodes = hexCodes
        self.creationDate = creationDate
    }
    
    func colors() -> [Color] {
        return hexCodes.compactMap { Color(hex: $0) }
    }
}
