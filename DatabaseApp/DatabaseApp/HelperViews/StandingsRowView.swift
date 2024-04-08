import SwiftUI

struct StandingsRowView: View {
    let teamData: CombinedTeamData
    
    var body: some View {
        HStack{
            Text(teamData.teamName)
                .frame(width: 100, alignment: .leading)
            Spacer()
            Text("\(teamData.matchesPlayed)")
                .frame(width: 30, alignment: .center)
            Spacer()
            Text("\(teamData.wins)")
                .frame(width: 30, alignment: .center)
            Spacer()
            Text("\(teamData.losses)")
                .frame(width: 30, alignment: .center)
            Spacer()
            Text("\(teamData.draws)")
                .frame(width: 30, alignment: .center)
            Spacer()
            Text("\(teamData.goals):\(teamData.conceded)")
                .frame(width: 40, alignment: .center)
            Spacer()
            Text("\(teamData.points)")
                .frame(width: 40, alignment: .center)
        }.padding(.all, 10)
    }
}
