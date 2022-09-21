//
//  ApodViewModel.swift
//
//  Created by hunter downey on 9/20/22.
//

import Foundation
import SwiftUI

class ApodViewModel: ObservableObject {
    
    struct Constants {
        static let apiKey = "Mjm0ReiMJU3Qy0rt5ZItSgSNYCjtGcnM2wc6lilL"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    @Published var apod = Apod(
        copyright: "Chris Willocks",
        date: "2022-09-20",
        explanation: "What's happening in the Statue of Liberty nebula?  Bright stars and interesting molecules are forming and being liberated. The complex nebula resides in the star forming region called RCW 57, and besides the iconic monument, to some looks like a flying superhero or a weeping angel.  By digitally removing the stars, this re-assigned color image showcases dense knots of dark interstellar dust, fields of glowing hydrogen gas ionized by these stars, and great loops of gas expelled by dying stars. A detailed study of NGC 3576, also known as NGC 3582 and NGC 3584, uncovered at least 33 massive stars in the end stages of formation, and the clear presence of the complex carbon molecules known as polycyclic aromatic hydrocarbons (PAHs). PAHs are thought to be created in the cooling gas of star forming regions, and their development in the Sun's formation nebula five billion years ago may have been an important step in the development of life on Earth.   Your Sky Surprise: What picture did APOD feature on your birthday? (post 1995)",
        hdurl: "https://apod.nasa.gov/apod/image/2209/NGC3576_Willocks_3300_Starless.jpg",
        title: "Star Forming Region NGC 3582 without Stars"
    )
    
    func fetch() {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=" + Constants.apiKey) else {
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
