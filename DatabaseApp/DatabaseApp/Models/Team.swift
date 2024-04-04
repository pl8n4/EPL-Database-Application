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
    var TeamName: String
    var StadiumName: String

    enum CodingKeys: String, CodingKey {
        case id = "TeamID"
        case TeamName, StadiumName
    }
}
