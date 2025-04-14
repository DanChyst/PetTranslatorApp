//
//  TranslationSimulator.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import Foundation

class TranslationSimulator {
    private let shortDogResponses = [
        "Woof!",
        "Feed me!",
        "Play?",
        "I love you!",
        "Walk now?"
    ]
    
    private let longDogResponses = [
        "I'm hungry, feed me please!",
        "I want to go for a walk right now!",
        "I'm so happy to see you, can we play?",
        "There's someone at the door, I must alert you!",
        "I've been waiting all day for you to come home!"
    ]
    
    private let shortCatResponses = [
        "Meow!",
        "Feed me.",
        "Pet me.",
        "Go away.",
        "Mine."
    ]
    
    private let longCatResponses = [
        "I demand food immediately, human.",
        "Your presence is acceptable. You may pet me now.",
        "This box is mine. All boxes are mine.",
        "I've knocked something off a shelf. Deal with it.",
        "What are you doing, human? Stop and pay attention to me."
    ]
    
    private let dogSounds = ["Woof", "Bark", "Ruff", "Arf", "Bow", "Grrr", "Yip", "Awoo"]
    
    private let catSounds = ["Meow", "Mrrr", "Purr", "Hiss", "Mew", "Nyaa", "Mrrrp", "Yowl"]
    
    
    
    func generateTranslation(mode: TranslationMode, inputLength: TimeInterval, petType: PetType) -> String {
        let isShortInput = inputLength < 2.0

        switch mode {
        case .humanToPet:
            return generatePetSound(for: petType)
        case .petToHuman:
            return generateHumanSentence(for: petType, short: isShortInput)
        }
    }
    
    private func generatePetSound(for pet: PetType) -> String {
        let sounds = pet == .dog ? dogSounds : catSounds
        let count = Int.random(in: 3...6)

        return (0..<count)
            .map { _ in sounds.randomElement()! + (Bool.random() ? "!" : "") }
            .joined(separator: " ")
    }
    
    private func generateHumanSentence(for pet: PetType, short: Bool) -> String {
        switch pet {
        case .dog:
            return short ? (shortDogResponses.randomElement() ?? "Woof!") :
                           (longDogResponses.randomElement() ?? "I love you!")
        case .cat:
            return short ? (shortCatResponses.randomElement() ?? "Meow!") :
                           (longCatResponses.randomElement() ?? "I demand food.")
        }
    }
    
    
}
