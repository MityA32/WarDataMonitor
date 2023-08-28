//
//  SummaryDataFetcher.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

final class SummaryDataFetcher {
    func readJSONFromGitHub<T: Decodable>(username: String, repository: String, branch: String, filePath: String, dataType: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        let urlString = "https://raw.githubusercontent.com/\(username)/\(repository)/\(branch)/\(filePath)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([T].self, from: data)
                    completion(.success(jsonData))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
            }
        }.resume()
    }
}
