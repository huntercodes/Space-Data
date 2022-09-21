//
//  ApodView.swift
//  Space Data
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ApodView: View {
    @StateObject var vm = ApodViewModel()
    
    var body: some View {
        VStack {
            Text("Astrology Photo Of The Day")
                .font(.title2)
            
            ApodCopyrightAndDateView()
            
            ApodImageView()
            
            ApodExplanationView()
        }
        .padding()
    }
}

struct ApodView_Previews: PreviewProvider {
    static var previews: some View {
        ApodView()
    }
}
