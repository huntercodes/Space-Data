//
//  APICaller.swift
//  Space Data
//
//  Created by hunter downey on 9/20/22.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    private init() { }
    
    // MARK: - API Key / Error
    
    struct Constants {
        static let apiKey = "Mjm0ReiMJU3Qy0rt5ZItSgSNYCjtGcnM2wc6lilL"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    // MARK: - API Calls
    
    public func getApod(completion: @escaping(Result<Apod, Error>) -> Void) {
        createRequest(
            with: URL(string: "https://api.nasa.gov/planetary/apod?api_key=" + Constants.apiKey),
            type: .GET
        ) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Apod.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Create Request
    
    enum HTTPMethod: String {
        case GET
        case POST
        case DELETE
    }
    
    private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping(URLRequest) -> Void) {
        guard let apiURL = url else { return }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 30
        
        completion(request)
    }
    
}
