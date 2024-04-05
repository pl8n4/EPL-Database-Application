//
//  PlayerViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 3/24/24.
//
import Foundation

class PlayersViewModel: ObservableObject {
    @Published var players: [Player] = []
    
    // Fetches player data from API endpoint
    func fetchPlayers(completion: @escaping () -> Void) {
        let urlString = "http://127.0.0.1:5000/players"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion()
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    print("Network request failed: \(error.localizedDescription)")
                    completion()
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    print("No data received")
                    completion()
                }
                return
            }
            do {
                let players = try JSONDecoder().decode([Player].self, from: data)
                DispatchQueue.main.async {
                    self?.players = players
                    completion()
                }
            } catch {
                DispatchQueue.main.async {
                    print("Failed to decode JSON: \(error)")
                    completion()
                }
            }
        }.resume()
    }
}


