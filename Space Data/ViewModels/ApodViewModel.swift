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
        copyright: "Francesco Antonucci",
        date: "2022-09-20",
        explanation: "The bright clusters and nebulae of planet Earth\'s night sky are often named for flowers or insects. Though its wingspan covers over 3 light-years, NGC 6302 is no exception. With an estimated surface temperature of about 250,000 degrees C, the dying central star of this particular planetary nebula has become exceptionally hot, shining brightly in ultraviolet light but hidden from direct view by a dense torus of dust.  This sharp close-up of the dying star\'s nebula was recorded in 2009 by the Hubble Space Telescope\'s Wide Field Camera 3, and is presented here in reprocessed colors.  Cutting across a bright cavity of ionized gas, the dust torus surrounding the central star is near the center of this view, almost edge-on to the line-of-sight. Molecular hydrogen has been detected in the hot star\'s dusty cosmic shroud. NGC 6302 lies about 4,000 light-years away in the arachnologically correct constellation of the Scorpion (Scorpius).",
        hdurl: "https://apod.nasa.gov/apod/image/1410/butterflyblue_hst_3919.jpg",
        title: "The Butterfly Nebula from Hubble"
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
