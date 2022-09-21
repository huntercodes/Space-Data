//
//  ApodViewModel.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

class ApodViewModel: ObservableObject {
    
    struct Constants {
        static let apiKey = "Mjm0ReiMJU3Qy0rt5ZItSgSNYCjtGcnM2wc6lilL"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    @Published var apod = Apod(
        copyright: "",
        date: "",
        explanation: "",
        hdurl: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_3919.jpg",
        title: ""
    )
    
    func fetch() {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=" + Constants.apiKey + "&date=2014-10-01") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Apod.self, from: data)
                DispatchQueue.main.async {
                    self.apod = result
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
