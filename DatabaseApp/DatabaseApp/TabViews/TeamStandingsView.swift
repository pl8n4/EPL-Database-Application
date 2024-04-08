//
//  TestTeamDetail.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/4/24.
//

import SwiftUI

struct TeamStandingsView: View {
    @StateObject private var coordinatorViewModel = StandingsCoordinatorViewModel()
    @StateObject private var playerStatsViewModel = PlayerStatsCoordinatorViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                // Title
                HStack {
                    Spacer()
                    Text("English Premier League")
                        .bold()
                        .font(.title)
                    Spacer()
                }
                ScrollView {
                    // Headers
                    HStack{
                        Text("Team")
                            .fontWeight(.bold).frame(width: 100, alignment: .leading)
                        Spacer()
                        Text("MP")
                            .fontWeight(.bold).frame(width: 30, alignment: .center)
                        Spacer()
                        Text("W")
                            .fontWeight(.bold).frame(width: 30, alignment: .center)
                        Spacer()
                        Text("L")
                            .fontWeight(.bold).frame(width: 30, alignment: .center)
                        Spacer()
                        Text("D")
                            .fontWeight(.bold).frame(width: 30, alignment: .center)
                        Spacer()
                        Text("GLS")
                            .fontWeight(.bold).frame(width: 40, alignment: .center)
                        Spacer()
                        Text("PTS")
                            .fontWeight(.bold).frame(width: 40, alignment: .center)
                    }.padding(.horizontal, 10)
                    // Data
                    ForEach(coordinatorViewModel.combinedTeamData, id: \.teamName) { teamData in
                        // Navigation link for more detailed team info
                        NavigationLink(destination: TeamDetailView(team: teamData, viewModel: playerStatsViewModel)) {
                            StandingsRowView(teamData: teamData)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }.onAppear {
                coordinatorViewModel.fetchAllDataAndCalculateStandings()
            }
        }
        
    }
}

#Preview {
    TeamStandingsView()
}
