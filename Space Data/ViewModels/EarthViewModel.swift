//
//  EarthViewModel.swift
//  Space Data
//
//  Created by hunter downey on 9/20/22.
//

import Foundation
import SwiftUI

class EarthViewModel: ObservableObject {
    
    struct Constants {
        static let apiKey = "Mjm0ReiMJU3Qy0rt5ZItSgSNYCjtGcnM2wc6lilL"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    @Published var earth = Earth(
        date: "2018-01-03T16:50:46.890000",
        url: "https://earthengine.googleapis.com/v1alpha/projects/earthengine-legacy/thumbnails/78ef0163adc2d4981e96b6a47dbccd48-5ad4e5bf6d136b979bcb7dbeb913e2e9:getPixels"
    )
    
    func fetch() {
        guard let url = URL(string: "https://api.nasa.gov/planetary/earth/assets?lon=-95.33&lat=29.78&date=2018-01-01&&dim=0.10&api_key=" + Constants.apiKey) else {
                return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Earth.self, from: data)
                DispatchQueue.main.async {
                    self.earth = result
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
