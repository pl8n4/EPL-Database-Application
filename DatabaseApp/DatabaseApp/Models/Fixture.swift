//
//  Fixture.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/18/24.
//

import Foundation

struct Fixtures: Identifiable {
    var id: Int
    var homeTeam: String
    var awayTeam: String
    let date: Date
    var played: Bool
    var result: String?
    
    var formattedDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy/M/d"
            return dateFormatter.string(from: date)
        }
}
