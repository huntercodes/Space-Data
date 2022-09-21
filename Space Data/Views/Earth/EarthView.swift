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
                .onAppear(perform: vm.fetch)
            
            Spacer()
                .frame(maxHeight: 15)
            
            EarthDateView()
            
            Spacer()
                .frame(maxHeight: 15)
            
            EarthImageView()
        }
    }
}

struct EarthView_Previews: PreviewProvider {
    static var previews: some View {
        EarthView()
    }
}
