//
//  PetAvatarView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

struct PetAvatarView: View {
    let petType: PetType
    @State private var isAnimating = false
    
    var body: some View {
            Image(petType == .dog ? "dog" : "cat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(petType == .dog ? .orange : .brown)
                .frame(width: 184, height: 184)
                .animation(
                    Animation.easeInOut(duration: 2)
                        .repeatForever(autoreverses: true),
                    value: isAnimating
                )
                .onAppear {
                    isAnimating = true
                }
    }
}

#Preview {
    PetAvatarView(petType: .dog)
}
