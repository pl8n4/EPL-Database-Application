//
//  Match.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 3/30/24.
//

import Foundation

// Data model for Match
struct Match: Decodable, Identifiable {
    var id: Int
    var date: Date
    var HomeTeamID: Int
    var AwayTeamID: Int
    var Result: String?
    var played: Bool {
        if (Result != nil){
            true
        } else {
            false
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "MatchID"
        case date = "Date"
        case HomeTeamID = "HomeTeamID"
        case AwayTeamID = "AwayTeamID"
        case Result = "Result"
    }
}

// Date formatter for the API endpoint date field
extension Match {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss 'GMT'"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Match.dateFormatter)
        return decoder
    }()
}
