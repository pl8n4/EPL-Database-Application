//
//  FixturesViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/12/24.
//

import Foundation

class FixturesViewModel: ObservableObject {
    
    @Published var fixtureData: [Fixtures] = []
    
    var matchViewModel = MatchesViewModel()
    var teamViewModel = TeamsViewModel()
    
    // Calls fetch and setup functions
    func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        matchViewModel.fetchMatches() {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        teamViewModel.fetchTeams() {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.matchData()
        }
    }
    

    // Gets all necessary data ready for view
    private func matchData() {
        // Convert list of teams to dictionary for quick lookup
        let teamsDictionary = Dictionary(uniqueKeysWithValues: teamViewModel.teams.map { ($0.id, $0) })

        var infos: [Fixtures] = []
        
        // Match data into fixture struct
        for match in matchViewModel.matches {
            if let homeTeam = teamsDictionary[match.HomeTeamID],
               let awayTeam = teamsDictionary[match.AwayTeamID] {
                let info = Fixtures(id: match.id, homeTeam: homeTeam.TeamName, awayTeam: awayTeam.TeamName,date: match.date, played: match.played , result: match.Result)
                infos.append(info)
            } else {
                // Log error or handle missing teams
                print("Error: Team not found for match ID \(match.id)")
            }
        }
        DispatchQueue.main.async {
            self.fixtureData = infos
        }
    }

}
