//
//  Assister.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/6/24.
//

import Foundation

struct Assister: Decodable, Identifiable{
    var matchID: Int
    var playerID: Int
    var numOfAssists: Int
    
    var id: String{
        "\(matchID)-\(playerID)"
    }
    
    enum CodingKeys: String, CodingKey {
        case matchID = "MatchID"
        case playerID = "PlayerID"
        case numOfAssists = "NumOfAssists"
    }
}
