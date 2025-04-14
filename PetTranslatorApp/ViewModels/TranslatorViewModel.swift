//
//  TranslatorViewModel.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//
import Foundation

class TranslatorViewModel: ObservableObject {
    @Published var translationMode: TranslationMode = .humanToPet
    @Published var isRecording = false
    @Published var showPermissionAlert = false
    @Published var translationResult = ""
    @Published var showingResult = false
    @Published var selectedPet: PetType = .dog
    @Published var isProcessingTranslation = false

    private let audioService = AudioRecordingService()
    private let translationSimulator = TranslationSimulator()
    
    private var recordingTimer: Timer?

    var currentPetType: PetType {
        return selectedPet
    }

    func handleRecordingTap() {
        if isRecording {
            stopRecording()
        } else {
            requestMicrophonePermission()
        }
    }

    func requestMicrophonePermission() {
        audioService.requestPermission { [weak self] granted in
            DispatchQueue.main.async {
                if granted {
                    self?.startRecording()
                } else {
                    self?.showPermissionAlert = true
                }
            }
        }
    }

    func startRecording() {
        isRecording = true
        audioService.startRecording()

        //stops after 20 seconds or after click
        recordingTimer = Timer.scheduledTimer(withTimeInterval: 20.0, repeats: false) { [weak self] _ in
            self?.stopRecording()
        }
    }

    func stopRecording() {
        recordingTimer?.invalidate()
        recordingTimer = nil
        isRecording = false

        let inputLength = audioService.stopRecording()
        isProcessingTranslation = true
        showingResult = true

        //show processing for 3–5 seconds
        let delay = Double.random(in: 3...5)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let self else { return }
            self.translationResult = self.translationSimulator.generateTranslation(
                mode: self.translationMode,
                inputLength: inputLength,
                petType: self.selectedPet
            )
            self.isProcessingTranslation = false
        }
    }

    func resetTranslation() {
        showingResult = false
        translationResult = ""
        isProcessingTranslation = false
    }
}
