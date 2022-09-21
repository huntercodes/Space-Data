//
//  EarthView.swift
//  Space Data
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct EarthView: View {
    @StateObject var vm = EarthViewModel()
    
    var body: some View {
        VStack {
            Text("Satellite Earth View")
                .font(.title2)
            
            EarthDateView()
            
            EarthImageView()
        }
    }
}

struct EarthView_Previews: PreviewProvider {
    static var previews: some View {
        EarthView()
    }
}
