//
//  ScorerViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/6/24.
//

import Foundation

// Combined ViewModel for scores and assisters
class ContributionsViewModel: ObservableObject {
    @Published var scorers: [Scorer] = []
    @Published var assisters: [Assister] = []
    
    // Calls scorer and assister fetch functions
    func fetchContributions(completion: @escaping () -> Void){
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchScorers() {
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        fetchAssisters(){
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            completion()
            }
    }
    
    // Fetches scorer data from API endpoint
    func fetchScorers(completion: @escaping () -> Void) {
        let urlString = "http://127.0.0.1:5000/scorers"
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
                let scorers = try JSONDecoder().decode([Scorer].self, from: data)
                DispatchQueue.main.async {
                    self?.scorers = scorers
                }
            } catch {
                DispatchQueue.main.async {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }.resume()
    }
    
    // Fetches assister data from API endpoint
    func fetchAssisters(completion: @escaping () -> Void) {
        let urlString = "http://127.0.0.1:5000/assisters"
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
                let assisters = try JSONDecoder().decode([Assister].self, from: data)
                DispatchQueue.main.async {
                    self?.assisters = assisters
                }
            } catch {
                DispatchQueue.main.async {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }.resume()
    }
}
