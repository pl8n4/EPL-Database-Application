//
//  CoordinatorViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 3/30/24.
//

import Foundation

class StandingsCoordinatorViewModel: ObservableObject {
    @Published var combinedTeamData: [CombinedTeamData] = []
    
    var teamsViewModel = TeamsViewModel()
    var matchesViewModel = MatchesViewModel()
    
    // Coordinates the data fetch and calculation function calls
    func fetchAllDataAndCalculateStandings() {
        let dispatchGroup = DispatchGroup()
                
        dispatchGroup.enter()
        teamsViewModel.fetchTeams {
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        matchesViewModel.fetchMatches {
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            self.calculateStandings()
        }
    }
    /*
    func matchTeams() {
        
        for teams in combinedTeamData {
            if let matchingTeam = teams.first(where: { $0.teamID == teamData.teamID }) {
                
                // At this point, `matchingTeam` is the Team instance that matches the playerData's teamID
                // You can now use `matchingTeam` for whatever processing you need, such as updating UI, aggregating data, etc.
                
                // For example, if you want to update the teamName in CombinedPlayerData in case it's outdated:
            }
        }
    */
    // Handles all the logic for calculating the stats for the StandingsView
    // **Refactor into smaller functions for re-usability in future**
    private func calculateStandings() {
        var standings: [Int: (teamName: String, teamID: Int,  matchesPlayed: Int, points: Int, wins: Int, losses: Int, draws: Int, goals: Int, conceded: Int, stadiumName: String)] = [:]

        
        // Initialize standings with teams
        for team in teamsViewModel.teams {
            standings[team.id] = (teamName: team.TeamName, teamID: team.id, matchesPlayed: 0, points: 0, wins: 0, losses: 0, draws: 0, goals: 0, conceded: 0, stadiumName: team.StadiumName)
        }


        // Loops through each match to calculate the different stats
        for match in matchesViewModel.matches {
            let result = match.Result.map { $0.split(separator: "-").map(String.init) }
            let homeGoals = result?.first.flatMap(Int.init) ?? 0 // if `result?.first` is nil, `homeGoals` will be 0
            let awayGoals = result?.last.flatMap(Int.init) ?? 0  // if `result?.last` is nil, `awayGoals` will be 0
            
            // Calcualtes the number of matches played for each team
            standings[match.HomeTeamID]?.matchesPlayed += 1
            standings[match.AwayTeamID]?.matchesPlayed += 1
            
            // Calcualtes the number of goals scored and conceded for each team
            standings[match.HomeTeamID]?.goals += homeGoals
            standings[match.AwayTeamID]?.conceded += homeGoals
            standings[match.AwayTeamID]?.goals += awayGoals
            standings[match.HomeTeamID]?.conceded += awayGoals
            
            // Calculates the points and W/L/T for each team
            if homeGoals > awayGoals {
                // Home team wins
                standings[match.HomeTeamID]?.points += 3
                standings[match.HomeTeamID]?.wins += 1
                standings[match.AwayTeamID]?.losses += 1
            } else if homeGoals < awayGoals {
                // Away team wins
                standings[match.AwayTeamID]?.points += 3
                standings[match.AwayTeamID]?.wins += 1
                standings[match.HomeTeamID]?.losses += 1
            } else {
                // Draw
                standings[match.HomeTeamID]?.points += 1
                standings[match.AwayTeamID]?.points += 1
                standings[match.HomeTeamID]?.draws += 1
                standings[match.AwayTeamID]?.draws += 1
            }
        }
        
        // Convert to and intialize CombinedTeamData for the view
        combinedTeamData = standings.map {
            CombinedTeamData(
                teamName: $0.value.teamName,
                teamID: $0.value.teamID,
                matchesPlayed: $0.value.matchesPlayed,
                points: $0.value.points,
                wins: $0.value.wins,
                losses: $0.value.losses,
                draws: $0.value.draws,
                goals: $0.value.goals,
                conceded: $0.value.conceded,
                stadiumName: $0.value.stadiumName
            )
        }.sorted { $0.points > $1.points }
    }
}



