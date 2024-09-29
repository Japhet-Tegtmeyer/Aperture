//
//  TopBarButton.swift
//  Aperture
//
//  Created by Japhet Tegtmeyer on 9/28/24.
//

import SwiftUI

struct TopBarButton: View {
    var action: () -> Void
    var symbol: String
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: symbol)
                .font(.subheadline)
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .background(.gray.opacity(0.3))
                .clipShape(Circle())
        }
    }
}
