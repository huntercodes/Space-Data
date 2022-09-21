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
        AsyncImage(url: URL(string: vm.earth.url)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 357, height: 357)
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .overlay(
            RoundedRectangle(cornerRadius: 13)
                .stroke(lineWidth: 2)
                .foregroundColor(.primary)
        )
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
