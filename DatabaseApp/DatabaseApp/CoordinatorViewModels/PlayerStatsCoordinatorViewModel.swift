//
//  PlayerStatsCoordinatorViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/4/24.
//

import Foundation

class PlayerStatsCoordinatorViewModel: ObservableObject {
    
    @Published var combinedPlayerData: [CombinedPlayerData] = []
    
    var contractViewModel = ContractsViewModel()
    var playerViewModel = PlayersViewModel()
    var teamViewModel = TeamsViewModel()
    var contributionsViewModel = ContributionsViewModel()
    
    // Calls fetch and calculation functions
    func fetchAllDataAndCalculateStats() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        playerViewModel.fetchPlayers {
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        teamViewModel.fetchTeams {
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        contractViewModel.fetchContracts {
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        contributionsViewModel.fetchContributions(){
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.calculatePlayerStats()
        }

    }
    
    // Matches players to teams using Contract model
    private func matchPlayersToTeams() {
        var infos: [CombinedPlayerData] = []
        
        for contract in contractViewModel.contracts {
            if let player = playerViewModel.players.first(where: { $0.id == contract.playerID }),
               let team = teamViewModel.teams.first(where: { $0.id == contract.teamID }) {
                let info = CombinedPlayerData(id: player.id, playerName: "\(player.Fname) \(player.Lname ?? "")", teamName: team.TeamName, teamID: team.id, goals: 0, assists: 0, position: player.Position)
                infos.append(info)
            }
        }
        
        self.combinedPlayerData = infos
    }
    
    // Calculates total goals and assists for each player
    func aggregateContributions() -> (goals: [Int: Int], assists: [Int: Int]) {
        var goalsByPlayer = [Int: Int]()
        var assistsByPlayer = [Int: Int]()

        for scorer in contributionsViewModel.scorers {
            goalsByPlayer[scorer.playerID, default: 0] += scorer.numOfGoals
        }

        for assister in contributionsViewModel.assisters {
            assistsByPlayer[assister.playerID, default: 0] += assister.numOfAssists
        }
        return (goals: goalsByPlayer, assists: assistsByPlayer)
    }

    // Calls functions to calculate and sets player stats
    func calculatePlayerStats(){
        matchPlayersToTeams()
        
        let contributions = aggregateContributions()
        
        var updatedData = [CombinedPlayerData]()
        
        for data in combinedPlayerData {
            if let player = playerViewModel.players.first(where: { "\($0.Fname) \($0.Lname ?? "")" == data.playerName }) {
                let updatedGoals = contributions.goals[player.id] ?? 0
                let updatedAssists = contributions.assists[player.id] ?? 0
                
                let updatedInfo = CombinedPlayerData(
                    id: data.id,
                    playerName: data.playerName,
                    teamName: data.teamName,
                    teamID: data.teamID,
                    goals: updatedGoals,
                    assists: updatedAssists,
                    position: data.position
                )
                updatedData.append(updatedInfo)
            }
        }
        
        // Update data
        DispatchQueue.main.async {
            self.combinedPlayerData = updatedData
        }
    }
}


