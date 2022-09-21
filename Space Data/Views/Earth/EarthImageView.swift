//
//  EarthImageView.swift
//  Space Data
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct EarthImageView: View {
    @StateObject var vm = EarthViewModel()
    
    var body: some View {
        AsyncImage(url: URL(string: vm.earth.url))
            .scaledToFill()
            .frame(width: 347, height: 547)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .overlay(RoundedRectangle(cornerRadius: 7)
                .stroke(lineWidth: 3)
                .foregroundColor(.primary)
            )
            .padding(1)
            .onAppear {
                vm.fetch()
            }
    }
}

struct EarthImageView_Previews: PreviewProvider {
    static var previews: some View {
        EarthImageView()
    }
}
