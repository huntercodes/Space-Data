//
//  EarthViewModel.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

class EarthViewModel: ObservableObject {
    
    struct Constants {
        static let apiKey = "Mjm0ReiMJU3Qy0rt5ZItSgSNYCjtGcnM2wc6lilL"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    @Published var earth = Earth(
        date: "2020-01-25 T 16:50:46.188000",
        url: "https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/2d2481df055ec42b95771985686eca91-0a57d20322f459533f41a1759e57a30b:getPixels"
    )
    
    func fetch() {
        guard let url = URL(string: "https://api.nasa.gov/planetary/earth/assets?lon=-95.33&lat=29.78&date=2020-01-12&&dim=0.10&api_key=" + Constants.apiKey) else {
                return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Earth.self, from: data)
                DispatchQueue.main.async {
                    self?.earth = result
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }

}
