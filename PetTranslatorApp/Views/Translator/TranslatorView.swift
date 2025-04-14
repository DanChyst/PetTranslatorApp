//
//  TranslatorView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

struct TranslatorView: View {
    @StateObject private var viewModel = TranslatorViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color(red: 243/255, green: 245/255, blue: 246/255), Color(red: 201/255, green: 255/255, blue: 224/255)], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                VStack() {
                    Text("Traslator")
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical, 20)
                    //Human - Pet translation Switcher
                    ModeSwitcherView(mode: $viewModel.translationMode)
                        .padding(.top, 30)
                    
                    Spacer()
                    
                    //Recording button or result display
                    if viewModel.showingResult {
                        if viewModel.isProcessingTranslation {
                                ProgressView("Process of translation...")
                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                    .scaleEffect(1.2)
                                    .padding(.top, 100)
                            } else {
                                TranslationResultView(
                                    result: viewModel.translationResult,
                                    onRepeat: {
                                        viewModel.resetTranslation()
                                    }
                                )
                            }
                    } else {
                        PetSelectorWithRecordingButton(
                            selectedPet: $viewModel.selectedPet,
                            isRecording: $viewModel.isRecording,
                            onRecordingTap: {
                                viewModel.handleRecordingTap()
                            }
                        )
                    }
                    
                    Spacer()
                    
                    //Pet avatar
                    PetAvatarView(petType: viewModel.currentPetType)
                        .padding(.bottom, 100) // Extra padding to avoid overlapping with bottom nav bar
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
        }
        .alert(isPresented: $viewModel.showPermissionAlert) {
            Alert(
                title: Text("Enable Microphone Access"),
                message: Text("Please allow access to your microphone to use the app's features"),
                primaryButton: .default(Text("Settings")) {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    TranslatorView()
}
