//
//  ApodExplanationView.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ApodExplanationView: View {
    @StateObject var vm = ApodViewModel()
    
    var body: some View {
        ScrollView {
            Text("Explanation: " + vm.apod.explanation)
                .font(.caption)
                .frame(width: 347, height: 347)
                .onAppear(perform: vm.fetch)
        }
    }
}

struct ApodExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ApodExplanationView()
    }
}
