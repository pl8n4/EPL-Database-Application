//
//  FixturesViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/12/24.
//

import Foundation

class FixturesViewModel: ObservableObject {
    
    @Published var fixtures: [Fixture] = []
    
    
    // Fetches fixture data from API endpoint
    func fetchFixtures(completion: @escaping () -> Void) {
        let urlString = "http://127.0.0.1:5000/fixtures"
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
                let fixtures = try JSONDecoder().decode([Fixture].self, from: data)
                DispatchQueue.main.async {
                    self?.fixtures = fixtures
                }
            } catch {
                DispatchQueue.main.async {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }.resume()
    }
    
}

