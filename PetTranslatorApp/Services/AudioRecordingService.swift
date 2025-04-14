//
//  AudioRecordingService.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import AVFoundation

class AudioRecordingService {
    private var audioRecorder: AVAudioRecorder?
    private var startTime: Date?
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            completion(granted)
        }
    }
    
    func startRecording() {
        startTime = Date()
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            
            
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let audioFilename = documentsDirectory.appendingPathComponent("recording.m4a")
            
            //audio settings
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            //start audio recording
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
            
        } catch {
            print("Could not start recording: \(error)")
        }
    }
    
    func stopRecording() -> TimeInterval {
        
        let duration = Date().timeIntervalSince(startTime ?? Date())
        
        // Stop recording
        audioRecorder?.stop()
        audioRecorder = nil
        
        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print("Could not deactivate audio session: \(error)")
        }
        
        return duration
    }
}
