//
//  ContractViewModel.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/4/24.
//

import Foundation

class ContractsViewModel: ObservableObject {
    @Published var contracts: [Contract] = []

    // Fetches match data from API endpoint
    func fetchContracts(completion: @escaping () -> Void) {
        let urlString = "http://127.0.0.1:5000/contracts"
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
                let contracts = try Contract.decoder.decode([Contract].self, from: data)
                DispatchQueue.main.async {
                    self?.contracts = contracts
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }
}
