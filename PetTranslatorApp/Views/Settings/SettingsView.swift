//
//  SettingsView.swift
//  PetTranslatorApp
//
//  Created by Dan on 2025-04-13.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                // Background gradient
                LinearGradient(colors: [Color(red: 243/255, green: 245/255, blue: 246/255), Color(red: 201/255, green: 255/255, blue: 224/255)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                // Settings list
                VStack(spacing: 12) {
                    Text("Settings")
                        .font(.largeTitle)
                        .bold()
                        .padding(.vertical, 20)
                    NavigationLink(destination: RateUsView()) {
                        SettingsButtonRow(title: "Rate Us")
                    }
                    
                    NavigationLink(destination: ShareAppView()) {
                        SettingsButtonRow(title: "Share App")
                    }
                    
                    NavigationLink(destination: ContactUsView()) {
                        SettingsButtonRow(title: "Contact Us")
                    }
                    
                    NavigationLink(destination: RestorePurchasesView()) {
                        SettingsButtonRow(title: "Restore Purchases")
                    }
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        SettingsButtonRow(title: "Privacy Policy")
                    }
                    
                    NavigationLink(destination: TermsOfUseView()) {
                        SettingsButtonRow(title: "Terms of Use")
                    }
                }
                .padding(.horizontal, 16)
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            Text("Settings")
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                                .padding(.top, 30)
//                        }
//                    }
            }
            .navigationBarHidden(true)
        }
    }
}

// Styled button row that matches the design
struct SettingsButtonRow: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(Color.black)
                .bold()
                .padding(.leading, 6)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color.black)
                .padding(.trailing, 6)
        }
        .padding(15)
        .background(Color(red: 214/255, green: 220/255, blue: 255/255))
        .cornerRadius(16)
    }
}

#Preview {
    SettingsView()
}
