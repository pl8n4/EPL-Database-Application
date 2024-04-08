//
//  Scorer.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/6/24.
//

import Foundation

// Scorer model
struct Scorer: Decodable, Identifiable{
    var matchID: Int
    var playerID: Int
    var numOfGoals: Int
    
    // Composite key
    var id: String {
        "\(matchID)-\(playerID)"
    }
    
    enum CodingKeys: String, CodingKey {
        case matchID = "MatchID"
        case playerID = "PlayerID"
        case numOfGoals = "NumOfGoals"
    }
}
