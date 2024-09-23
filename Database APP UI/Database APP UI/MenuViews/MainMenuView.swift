//
//  MainMenuView.swift
//  Database APP UI
//
//  Created by Pablo Lasarte on 9/23/24.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        TabView {
            TeamStandingsView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Standings")
                }
            FixturesView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Fixtures")
                }
        }
    }
}

#Preview {
    MainMenuView()
}
