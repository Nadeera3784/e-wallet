//
//  ProfileView.swift
//  e-wallet
//
//  Created by Nadeera Sampath on 2024-01-07.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var notificationsEnabled = true
    
    var body: some View {
        NavigationView {
                    List {
                        // Profile Header
                        VStack(alignment: .center, spacing: 8) {
                            Image("avatar") // Replace with your image name
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 4)
                            Text("John Richard")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .listRowInsets(EdgeInsets())

                        // Menu Items
                        SettingItem(iconName: "creditcard", title: "Payment Methods")
                        SettingItemToggle(iconName: "bell", title: "Notifications", isOn: $notificationsEnabled)
                        SettingItem(iconName: "key", title: "Change Password")
                        SettingItemToggle(iconName: "lock.doc.fill", title: "Two-Factor Authentication", isOn: $notificationsEnabled)
                        SettingItem(iconName: "questionmark.circle", title: "Support")
                        SettingItem(iconName: "arrow.right.square", title: "Logout")
                    }
                    .listRowSpacing(0.1)
                    .listStyle(GroupedListStyle())
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                Image(systemName: "chevron.left")
                                
                                Text("Profile")
                                    .font(.headline)
                            }
                        }

                    }
                }
    }
}

struct SettingItem: View {
    var iconName: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            Text(title)
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
    }
}

// Reusable view for settings items with toggle
struct SettingItemToggle: View {
    var iconName: String
    var title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            Text(title)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(Color("COLOR_PRIMARY"))
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
    }
}


#Preview {
    ProfileView()
}
