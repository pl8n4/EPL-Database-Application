//
//  MainMenuView.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/8/24.
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
                    Image(systemName: "list.number")
                    Text("Fixtures")
                }
        }
    }
}

#Preview {
    MainMenuView()
}
