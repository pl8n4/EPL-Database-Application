//
//  NetworkConnection.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 3/24/24.
//
import Foundation

// Data model for Player
struct Player: Decodable, Identifiable {
    var id: Int 
    var Fname: String
    var Lname: String?
    var DOB: Date?
    var Nationality: String
    var Position: String

    enum CodingKeys: String, CodingKey {
        case id = "PlayerID"
        case Fname, Lname, DOB, Nationality, Position
    }
}
