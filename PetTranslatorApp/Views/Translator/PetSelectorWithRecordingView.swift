//
//  PetSelectorWithRecordingView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-14.
//
import SwiftUI

struct PetSelectorWithRecordingButton: View {
    @Binding var selectedPet: PetType
    @Binding var isRecording: Bool
    let onRecordingTap: () -> Void
    
    var body: some View {
        HStack(spacing: 30) {
            //Recording button
            RecordingButton(isRecording: $isRecording, onTap: onRecordingTap)
            
            //Pet selector that appears only when not recording
            PetSelectorView(selectedPet: $selectedPet, isRecording: isRecording)
        }
    }
}

#Preview {
    @Previewable @State var selectedPet: PetType = .dog
    @Previewable @State var isRecording = false
    PetSelectorWithRecordingButton(selectedPet: $selectedPet, isRecording: $isRecording, onRecordingTap: {isRecording =
        !isRecording} )
}
