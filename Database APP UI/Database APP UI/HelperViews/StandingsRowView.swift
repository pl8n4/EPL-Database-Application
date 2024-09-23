//
//  StandingsRowView.swift
//  Database APP UI
//
//  Created by Pablo Lasarte on 9/23/24.
//

import SwiftUI

struct StandingsRowView: View {
    let teamData: Team
    
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
            Text("\(teamData.scoredGoals):\(teamData.concededGoals)")
                .frame(width: 40, alignment: .center)
            Spacer()
            Text("\(teamData.points)")
                .frame(width: 40, alignment: .center)
        }.padding(.all, 10)
    }
}
