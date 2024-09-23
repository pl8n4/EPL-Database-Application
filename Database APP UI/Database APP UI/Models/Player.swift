//
//  Player.swift
//  Database APP UI
//
//  Created by Pablo Lasarte on 9/23/24.
//
import Foundation

// Data model for Player
struct Player: Decodable, Identifiable {
    var id: Int
    var name: String?
    var teamName: String
    var teamID: Int
    var goals: Int
    var assists: Int
    var position: String
    var DOB: Date?
    var nationality: String

    enum CodingKeys: String, CodingKey {
        case id = "playerID"
        case name = "playerName"
        case teamName, teamID, goals, assists, position, DOB, nationality
    }
}

