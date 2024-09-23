//
//  PlayerViewModel.swift
//  Database APP UI
//
//  Created by Pablo Lasarte on 9/23/24.
//
import Foundation

class PlayersViewModel: ObservableObject {
    @Published var players: [Player] = []
    
    // Fetches player data from API endpoint
    func fetchPlayers(completion: @escaping () -> Void) {
        let urlString = "http://127.0.0.1:5000/players"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            defer { DispatchQueue.main.async { completion() } }
                
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    print("Network request failed: \(error?.localizedDescription ?? "Unknown error")")
                }
                return
            }
                
            do {
                let players = try JSONDecoder().decode([Player].self, from: data)
                DispatchQueue.main.async {
                    self?.players = players
                }
            } catch {
                DispatchQueue.main.async {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }.resume()
    }
}


