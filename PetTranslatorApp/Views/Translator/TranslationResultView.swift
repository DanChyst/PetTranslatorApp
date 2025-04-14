//
//  TranslationResultView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

import SwiftUI

struct TranslationResultView: View {
    let result: String
    let onRepeat: () -> Void
    
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 50) {
            
            //Repeat btn
            Button(action: onRepeat) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 16))
                    Text("Repeat")
                        .font(.system(size: 16, weight: .medium))
                }
                .foregroundColor(.blue)
                .padding(.horizontal, 25)
                .padding(.vertical, 12)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5)
            }
            
            //Speech bubble with result
            SpeechBubble(text: result)
                .scaleEffect(isAnimating ? 1.02 : 1.0)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true),
                    value: isAnimating
                )
                .onAppear {
                    isAnimating = true
                }
        }
        .padding(.horizontal, 20)
    }
}

struct SpeechBubble: View {
    let text: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            //Translation text
            Text(text)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .background(Color(red: 214/255, green: 220/255, blue: 255/255))
                .cornerRadius(16)
            
            //Triangle pointer
            Image(systemName: "triangle.fill")
                .font(.system(size: 24))
                .foregroundColor(Color(red: 214/255, green: 220/255, blue: 255/255))
                .offset(y: -8) // Overlap with the bubble
                .shadow(color: Color.black.opacity(0.05), radius: 3)
        }
        .shadow(color: Color.black.opacity(0.1), radius: 5)
    }
}


#Preview {
    TranslationResultView(result: "Woof woof!") {
        print("Repeat tapped")
    }
}
