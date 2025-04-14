//
//  BottomNavigationBar.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

struct BottomNavigationBar: View {
    @Binding var selectedTab: NavigationItem
    
    var body: some View {
        HStack(spacing: 24) {
            NavigationButton(
                isSelected: selectedTab == .translator,
                icon: "message",
                title: "Translator") {
                    selectedTab = .translator
                }
            
            NavigationButton(
                isSelected: selectedTab == .settings,
                icon: "gear",
                title: "Settings") {
                    selectedTab = .settings
                }
        }
        .padding(.vertical, 19)
        .padding(.horizontal, 24)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        
    }
}

struct NavigationButton: View {
    let isSelected: Bool
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(title)
                    .font(.system(size: 12))
                    .bold()
            }
            .foregroundColor(isSelected ? Color.blue : Color.gray)
        }
    }
}

enum NavigationItem {
    case translator
    case settings
}

// Preview provider for SwiftUI Canvas
struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(UIColor.systemGray6).ignoresSafeArea()
            
            BottomNavigationBar(selectedTab: .constant(.translator))
        }
    }
}
