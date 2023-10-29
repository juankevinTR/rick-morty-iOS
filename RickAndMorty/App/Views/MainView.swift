//
//  MainView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 25/7/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("hello_world")
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
