//
//  TeamDetailView.swift
//  Database APP UI
//
//  Created by Pablo Lasarte on 9/23/24.
//

import SwiftUI

struct TeamDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var players = PlayersViewModel()
    var team: Team
    
    
    var body: some View {
        VStack{
            // Navigation header
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Back")
                    }
                }
                .padding(.leading)
                .accentColor(.primary)
                
                Spacer()
                
                Text(team.teamName)
                    .bold()
                    .font(.title)
                    .padding(.trailing)
                
                Spacer()
                Spacer()
            }
            Divider()
            ScrollView {
                VStack {
                    HStack{
                        Text("\(team.stadiumName)")
                            .font(.subheadline)
                        Spacer()
                        Image(team.teamName).resizable().scaledToFit().frame(width: 150, height: 100)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7)
                        Divider()
                    }.padding(.all)
                    // Calls view to handle player stats
                    PlayerStatsDetailView(viewModel: players, teamID: team.id)
                }
            }
            .navigationBarHidden(true)
            .onAppear{
                players.fetchPlayers {
                    print("Players fetched")
                }
            }
        }
    }
}
/*
#Preview {
    TeamDetailView()
}
*/

