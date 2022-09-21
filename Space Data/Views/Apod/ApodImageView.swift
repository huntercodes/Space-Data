//
//  ApodImageView.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ApodImageView: View {
    @StateObject var vm = ApodViewModel()
    
    var body: some View {
        AsyncImage(url: URL(string: vm.apod.hdurl)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 357, height: 357)
        .background(Color.black.gradient)
        .clipShape(RoundedRectangle(cornerRadius: 13))
        .overlay(
            RoundedRectangle(cornerRadius: 13)
                .stroke(lineWidth: 2)
                .foregroundColor(.primary)
        )
        .onAppear(perform: vm.fetch)
    }
}

struct ApodImageView_Previews: PreviewProvider {
    static var previews: some View {
        ApodImageView()
    }
}
