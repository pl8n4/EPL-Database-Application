//
//  FixturesRowView.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/11/24.
//

import SwiftUI


struct FixturesRowView: View {
    let fixtureData: Fixtures
    
    var body: some View {
        HStack{
            Text(fixtureData.homeTeam)
                .foregroundColor(.primary)
                .frame(width: 100, /*height: 50, */alignment: .leading)
                .fixedSize(horizontal: true, vertical: true)
                .multilineTextAlignment(.leading)
            Spacer()
            Text("\(fixtureData.awayTeam)")
                .foregroundColor(.primary)
                .frame(width: 100, /*height: 50,*/ alignment: .leading)
                .fixedSize(horizontal: true, vertical: true)
                .multilineTextAlignment(.leading)
            Spacer()
            Text("\(fixtureData.formattedDate)")
                .foregroundColor(.primary)
                .frame(width: 70, /*height: 50,*/ alignment: .center)
                .fixedSize(horizontal: true, vertical: true)
            Spacer()
            Text("\(fixtureData.result ?? "N/A")")
                .foregroundColor(.primary)
                .frame(width: 70, alignment: .center)
        }
        .padding(.all)
    }
}
