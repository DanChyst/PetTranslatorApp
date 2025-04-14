//
//  RecordingButton.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

struct RecordingButton: View {
    @Binding var isRecording: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                ZStack {
                    //Btn Background
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .frame(width: 180, height: 180)
                        .shadow(color: isRecording ? Color.red.opacity(0.3) : Color.black.opacity(0.1),
                                radius: isRecording ? 10 : 5)
                    
                    //Recording animation
                    if isRecording {
                        ForEach(0..<3) { i in
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.purple.opacity(0.8), lineWidth: 2)
                                .frame(width: 120 + CGFloat(i * 20),
                                       height: 120 + CGFloat(i * 20))
                                .opacity(isRecording ? 0.0 : 0.8)
                                .animation(Animation.easeInOut(duration: 1)
                                            .repeatForever(autoreverses: true)
                                            .delay(Double(i) * 0.2),
                                          value: isRecording)
                        }
                    }
                    //Btn Content
                    VStack {
                        Image(systemName: isRecording ? "waveform" : "mic")
                            .font(.system(size: 60))
                            .foregroundColor(isRecording ? .red : .black)
                            .padding(.bottom, 8)
                        
                        Text(isRecording ? "Recording..." : "Start Speak")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        if isRecording{
                            Text("Press to stop")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                       
                    }
                }
            }
            .scaleEffect(isRecording ? 1.05 : 1.0)
            .animation(.spring(), value: isRecording)
        }
        .buttonStyle(PlainButtonStyle()) // Prevents default button styling
    }
}

#Preview {
    @Previewable @State var isRecording = false
    RecordingButton(isRecording: $isRecording, onTap: {isRecording =
        !isRecording})
}
