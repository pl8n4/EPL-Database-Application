//
//  CombinedPlayerData.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/8/24.
//

import Foundation

struct CombinedPlayerData: Identifiable {
    let id: Int
    let playerName: String
    let teamName: String
    let teamID: Int
    let goals: Int
    let assists: Int
    let position: String
}
