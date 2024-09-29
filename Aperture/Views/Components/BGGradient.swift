//
//  BGGradient.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import SwiftUI

struct BGGradient: View {
    private let colors: [Color] = [
        .black,
        .black,
        .black,
        .cyan,
        .blue,
        .blue,
        .teal,
        .green,
        .green
    ]

    private let points: [SIMD2<Float>] = [
      SIMD2<Float>(0.0, 0.0), SIMD2<Float>(0.5, 0.0), SIMD2<Float>(1.0, 0.0),
      SIMD2<Float>(0.0, 0.5), SIMD2<Float>(0.5, 0.5), SIMD2<Float>(1.0, 0.5),
      SIMD2<Float>(0.0, 1.0), SIMD2<Float>(0.5, 1.0), SIMD2<Float>(1.0, 1.0)
    ]
    
    var body: some View {
        TimelineView(.animation) { timeline in
            MeshGradient(
                width: 3,
                height: 3,
                locations: .points(points),
                colors: .colors(animatedColors(for: timeline.date)),
                background: .black,
                smoothsColors: true
            )
        }
        .ignoresSafeArea()
    }
    
    private func animatedColors(for date: Date) -> [Color] {
        let phase = CGFloat(date.timeIntervalSince1970)
        
        return colors.enumerated().map { index, color in
            let hueShift = cos(phase + Double(index) * 0.3) * 0.1
            return shiftHue(of: color, by: hueShift)
        }
    }
    
    private func shiftHue(of color: Color, by amount: Double) -> Color {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        UIColor(color).getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        hue += CGFloat(amount)
        hue = hue.truncatingRemainder(dividingBy: 1.0)
        
        if hue < 0 {
            hue += 1
        }
        
        return Color(hue: Double(hue), saturation: Double(saturation), brightness: Double(brightness), opacity: Double(alpha))
    }
}

#Preview {
    BGGradient()
}
