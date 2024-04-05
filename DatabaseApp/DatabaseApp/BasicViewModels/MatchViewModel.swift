//
//  MatchViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 3/30/24.
//

import Foundation

class MatchesViewModel: ObservableObject {
    @Published var matches: [Match] = []

    // Fetches match data from API endpoint
    func fetchMatches(completion: @escaping () -> Void) {
        let urlString = "http://127.0.0.1:5000/matches"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            defer { DispatchQueue.main.async { completion() } }
            guard let data = data, error == nil else {
                print("Network request failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let matches = try Match.decoder.decode([Match].self, from: data)
                DispatchQueue.main.async {
                    self?.matches = matches
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }
}
