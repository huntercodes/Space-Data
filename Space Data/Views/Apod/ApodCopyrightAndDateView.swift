//
//  ApodCopyrightAndDateView.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ApodCopyrightAndDateView: View {
    @StateObject var vm = ApodViewModel()

    var body: some View {
        HStack {
            VStack {
                Text("Photo By")
                    .font(.subheadline)
                    .padding(1)
                
                Text(vm.apod.copyright)
                    .font(.subheadline)
                    .padding(1)
            }
            
            Spacer()
                .frame(maxWidth: 30)
            
            Text("|")
                .font(.title)
                .padding(1)
            
            Spacer()
                .frame(maxWidth: 30)
            
            VStack {
                Text("Captured On")
                    .font(.subheadline)
                    .padding(1)
                
                Text(vm.apod.date)
                    .font(.subheadline)
                    .padding(1)
            }
        }
    }
}

struct ApodCopyrightAndDateView_Previews: PreviewProvider {
    static var previews: some View {
        ApodCopyrightAndDateView()
    }
}
