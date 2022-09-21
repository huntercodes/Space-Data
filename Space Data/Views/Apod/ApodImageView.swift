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
            .frame(width: 347, height: 347)
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

struct ApodImageView_Previews: PreviewProvider {
    static var previews: some View {
        ApodImageView()
    }
}
