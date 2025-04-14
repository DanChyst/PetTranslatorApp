//
//  PetSelectorView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-14.
//
import SwiftUI

struct PetSelectorView: View {
    @Binding var selectedPet: PetType
    let isRecording: Bool
    
    var body: some View {
        if !isRecording {
            
            VStack(spacing: 15) {
                //Cat button
                petButton(petType: .cat, bgColor: Color.blue.opacity(0.1))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedPet = .cat
                        }
                    }
                
                //Dog button
                petButton(petType: .dog, bgColor: Color.green.opacity(0.1))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedPet = .dog
                        }
                    }
            }
            .padding(15)
            .background(Color.white)
            .cornerRadius(24)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
            .transition(.scale.combined(with: .opacity))
            .animation(.spring(), value: isRecording)
        }
    }
    
    //Function to create custom pet button
    private func petButton(petType: PetType, bgColor: Color) -> some View {
        ZStack {
            //Btn background
            RoundedRectangle(cornerRadius: 16)
                .fill(bgColor)
                .frame(width: 70, height: 70)
            
            //Pet image
            Image(petType == .cat ? .cat : .dog)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        .opacity(selectedPet == petType ? 1.0 : 0.5) //Dim non-selected buttons
        .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(selectedPet == petType ? Color.orange : Color.clear, lineWidth: 2)
                )
    }
}

#Preview {
    @Previewable @State var selectedPet: PetType = .dog
    return PetSelectorView(selectedPet: $selectedPet, isRecording: false)
}
