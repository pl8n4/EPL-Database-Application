//
//  Team.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 3/25/24.
//

import Foundation

// Data model for Team
struct Team: Decodable, Identifiable {
    var id: Int
    var teamName: String
    var stadiumName: String
    var matchesPlayed: Int
    var draws: Int
    var losses: Int
    var wins: Int
    var points: Int
    var scoredGoals: Int
    var concededGoals: Int
    

    enum CodingKeys: String, CodingKey {
        case id = "teamID"
        case teamName, stadiumName, matchesPlayed, draws, losses, wins, points, scoredGoals, concededGoals
    }
}
