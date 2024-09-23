//
//  PlayerStatsDetailView.swift
//  Database APP UI
//
//  Created by Pablo Lasarte on 9/23/24.
//

import SwiftUI

struct PlayerStatsDetailView: View {
    @ObservedObject var viewModel = PlayersViewModel()
    let teamID: Int

    
    // Matches players correct team and sorts them by goal contributions
    var filteredPlayerStats: [Player] {
        let filteredStats = viewModel.players.filter { $0.teamID == teamID }
        return filteredStats.sorted {
            if $0.goals == $1.goals {
                return $0.assists > $1.assists
            }
            return $0.goals > $1.goals
        }
    }

    var body: some View {
        ScrollView{
            VStack{
                // Headers
                HStack{
                    Text("Name")
                        .fontWeight(.bold).frame(width: 100, alignment: .leading)
                    Spacer()
                    Text("Goals")
                        .fontWeight(.bold).frame(width: 70, alignment: .center)
                    Spacer()
                    Text("Assists")
                        .fontWeight(.bold).frame(width: 70, alignment: .center)
                    Spacer()
                    Text("Position")
                        .fontWeight(.bold).frame(width: 100, alignment: .center)
                }.padding(.horizontal, 10)
            }
            // Data
            ForEach(filteredPlayerStats, id: \.id) { playerStat in
                VStack{
                    PlayerStatsRowView(playerData: playerStat)
                }
            }
        }
    }
}

