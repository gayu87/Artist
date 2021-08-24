//
//  ArtistAPIManager.swift
//  Artist
//
//  Created by gayatri patel on 8/23/21.
//

import Foundation

enum APIError: String, Error {
    case badUrl = "Please search with different artist name"
    case invalidData = "This search has returned invalid data"
    case invalidJosn = "not able to parse JSON"
}

class ArtistAPIManager {
    
    func getData(for artistName: String, completionHandler: @escaping (Result<ArtistData, APIError>) -> Void)  {
        
        let baseUrl = "https://itunes.apple.com/search?term=\(artistName)"
        guard let url = URL(string: baseUrl) else {
            completionHandler(.failure(.badUrl))
            print("invalid Artist name")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.badUrl))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.invalidData))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let ArtistInfo = try decoder.decode(ArtistData.self, from: data)
                completionHandler(.success(ArtistInfo))
            } catch {
                completionHandler(.failure(.invalidJosn))
            }
        }
        task.resume()
    }
}

