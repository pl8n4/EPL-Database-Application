import SwiftUI

struct TeamStandingsView: View {
    @StateObject private var standings = TeamViewModel()
    
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
                        Text("GS")
                            .fontWeight(.bold).frame(width: 40, alignment: .center)
                        Spacer()
                        Text("PTS")
                            .fontWeight(.bold).frame(width: 40, alignment: .center)
                    }.padding(.horizontal, 10)
                    
                    // Data
                    ForEach(standings.teams, id: \.id) { teamData in
                        // Navigation link for more detailed team info
                        NavigationLink(destination: TeamDetailView(team: teamData)) {
                            StandingsRowView(teamData: teamData)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }.onAppear {
                standings.fetchTeams {
                    print("Teams fetched")
                }
            }
        }
    }
}

#Preview {
    TeamStandingsView()
}

