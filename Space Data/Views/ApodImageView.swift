//
//  ApodImageView.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ApodImageView: View {
    @StateObject var vm = ApodViewModel()
    
    var body: some View {
        AsyncImage(url: URL(string: vm.apod.hdurl))
            .scaledToFill()
            .frame(width: 360, height: 360)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 4)
                .foregroundColor(.primary)
            )
            .padding(1)
            .onAppear {
                vm.fetch()
            }
    }
}

struct ApodImageView_Previews: PreviewProvider {
    static var previews: some View {
        ApodImageView()
    }
}
