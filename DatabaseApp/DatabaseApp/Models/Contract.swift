//
//  Contract.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/4/24.
//

import Foundation

struct Contract: Decodable, Identifiable {
    var id: Int
    var teamID: Int
    var playerID: Int
    var value: Int?
    var startDate: Date?
    var endDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case id = "ContractID"
        case teamID = "TeamID"
        case playerID = "PlayerID"
        case value = "Value"
        case startDate = "StartDate"
        case endDate = "EndDate"
    }
}

// Date formatter
extension Contract {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss 'GMT'"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Contract.dateFormatter)
        return decoder
    }()
}
