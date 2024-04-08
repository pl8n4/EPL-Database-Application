//
//  TeamDetailRowView.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/6/24.
//

import SwiftUI

struct PlayerStatsRowView: View {
    let playerData: CombinedPlayerData
    
    var body: some View {
        HStack{
            Text(playerData.playerName)
                .frame(width: 100, alignment: .leading)
            Spacer()
            Text("\(playerData.goals)")
                .frame(width: 70, alignment: .center)
            Spacer()
            Text("\(playerData.assists)")
                .frame(width: 70, alignment: .center)
            Spacer()
            Text("\(playerData.position)")
                .frame(width: 100, alignment: .center)
        }.padding(.all, 10)
    }
}

