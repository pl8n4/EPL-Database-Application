//
//  FixturesView.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/8/24.
//

import SwiftUI

struct FixturesView: View {
    @StateObject var fixtures = FixturesViewModel()
    @State private var showPlayedOnly = false
    
    var filteredMatches: [Fixture] {
            fixtures.fixtures.filter { fixture in
                (!showPlayedOnly || fixture.played)
            }
    }
    
    var body: some View {
        VStack {
            Text("Fixtures").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Toggle("Show Played Games Only", isOn: $showPlayedOnly)
                .padding(.horizontal)
            ScrollView(){
                HStack{
                    Text(" Home")
                        .fontWeight(.bold).frame(width: 100, alignment: .leading)
                    Spacer()
                    Text(" Away")
                        .fontWeight(.bold).frame(width: 100, alignment: .leading)
                    Spacer()
                    Text("Date")
                        .fontWeight(.bold).frame(width: 70, alignment: .center)
                    Spacer()
                    Text("Result")
                        .fontWeight(.bold).frame(width: 70, alignment: .center)
                }.padding(.horizontal)
                ForEach(filteredMatches, id: \.id) { fixture in
                    NavigationLink(destination: FixtureDetailView()) {
                        FixturesRowView(fixtureData: fixture)
                    }
                }
            }
        }
        .onAppear {
            fixtures.fetchFixtures(){
                print("Fixtures fetched.")
            }
        }
    }
}

#Preview {
    FixturesView()
}
