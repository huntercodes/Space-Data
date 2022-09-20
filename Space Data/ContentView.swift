//
//  ContentView.swift
//  Space Data
//
//  Created by hunter downey on 9/20/22.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        fetchData()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("")
        }
        .padding()
    }
    
    func fetchData() {
        APICaller.shared.getApod { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let data):
                        var apod = Apod(
                            copyright: data.copyright,
                            date: data.date,
                            explanation: data.explanation,
                            hdurl: data.hdurl,
                            title: data.title
                        )
                        print(apod.explanation)
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
