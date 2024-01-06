//
//  ContentView.swift
//  e-wallet
//
//  Created by Nadeera Sampath on 2024-01-07.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.white)
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Image(systemName: "line.horizontal.3.circle")
                    }

                    .tag(0)

                ChartView()
                    .tabItem {
                        Image(systemName: "chart.line.downtrend.xyaxis.circle")
                    }
                    .tag(1)

                Text("Center")
                    .tabItem {
                        Image(systemName: "doc.viewfinder")
                    }
                    .tag(2)

                NotificationView()
                    .tabItem {
                        Image(systemName: "bell")
                    }
                    .tag(3)

                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .tag(4)
            }
            .accentColor(Color("COLOR_PRIMARY"))
            .background(Color.white)
        }
    }
}

#Preview {
    ContentView()
}
