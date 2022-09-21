//
//  EarthDateView.swift
//  Space Data
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct EarthDateView: View {
    @StateObject var vm = EarthViewModel()
    
    var body: some View {
        HStack {
            Text("|")
                .font(.title)
                .padding(1)
            
            Spacer()
                .frame(maxWidth: 30)
            
            Text(vm.earth.date)
                .font(.title3)
                .padding(1)
            
            Spacer()
                .frame(maxWidth: 30)
            
            Text("|")
                .font(.title)
                .padding(1)
        }
    }
}

struct EarthDateView_Previews: PreviewProvider {
    static var previews: some View {
        EarthDateView()
    }
}
