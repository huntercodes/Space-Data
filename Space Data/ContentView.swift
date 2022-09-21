//
//  ContentView.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var eVM = EarthViewModel()
    @StateObject var aVM = ApodViewModel()
    
    var body: some View {
        TabView {
            ApodView()
                .tabItem {
                    Label("APOD", systemImage: "moon.stars")
                }
            EarthView()
                .tabItem {
                    Label("EARTH", systemImage: "globe.americas.fill")
                }
        }
        .accentColor(.red)
        .onAppear {
            eVM.fetch()
            aVM.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
