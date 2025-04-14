//
//  ModeSwitcherView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

struct ModeSwitcherView: View {
    @Binding var mode: TranslationMode
    
    var body: some View {
        HStack(spacing: 0) {
            //Left label
            Text(mode == .humanToPet ? "HUMAN" : "pet")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
            
            //Switch Icon
            Button(action: {
                withAnimation {
                    mode = mode == .humanToPet ? .petToHuman : .humanToPet
                }
            }) {
                Image(systemName: "arrow.left.arrow.right")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            
            //Right label
            Text(mode == .humanToPet ? "PET" : "HUMAN")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    @State var mode: TranslationMode = .humanToPet
    return ModeSwitcherView(mode: $mode)
}
