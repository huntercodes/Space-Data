//
//  ContentView.swift
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var apodVM = ApodViewModel()
    @StateObject var earthVM = EarthViewModel()
    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
