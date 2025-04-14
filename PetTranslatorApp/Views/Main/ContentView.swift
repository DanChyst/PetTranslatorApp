//
//  ContentView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: NavigationItem = .translator
    
    var body: some View {
        ZStack(alignment: .bottom) {
            //main content area that changes based on selected tab
            TabContentView(selectedTab: $selectedTab)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            //custom navigation bar
            BottomNavigationBar(selectedTab: $selectedTab)
                .padding(.bottom, 30)
        }
        .background(LinearGradient(colors: [Color(red: 243/255, green: 245/255, blue: 246/255), Color(red: 201/255, green: 255/255, blue: 224/255)], startPoint: .top, endPoint: .bottom))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct TabContentView: View {
    @Binding var selectedTab: NavigationItem
    
    var body: some View {
        switch selectedTab {
        case .translator:
            TranslatorView()
        case .settings:
            SettingsView()
        }
    }
}
#Preview {
    ContentView()
}
