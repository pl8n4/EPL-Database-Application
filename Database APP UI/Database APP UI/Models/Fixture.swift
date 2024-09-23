//
//  Fixture.swift
//  Database APP UI
//
//  Created by Pablo Lasarte on 9/23/24.
//
import Foundation

struct Fixture: Decodable, Identifiable {
    var id: Int
    var homeTeam: String
    var awayTeam: String
    var result: String?
    var played: Bool
    var date: Date  // This is now a Date object

    enum CodingKeys: String, CodingKey {
        case id = "fixtureID"
        case homeTeam
        case awayTeam
        case result
        case played
        case date
    }

    // Custom initializer to decode the Unix timestamp
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        homeTeam = try container.decode(String.self, forKey: .homeTeam)
        awayTeam = try container.decode(String.self, forKey: .awayTeam)
        result = try? container.decode(String.self, forKey: .result)
        played = try container.decode(Bool.self, forKey: .played)

        // Decode the timestamp (Double) and convert to Date
        let timestamp = try container.decode(Double.self, forKey: .date)
        date = Date(timeIntervalSince1970: timestamp)
    }

    // Human-friendly date formatting
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium  // e.g., "Oct 8, 2023"
        dateFormatter.timeStyle = .none    // Hide the time
        return dateFormatter.string(from: date)
    }
}

