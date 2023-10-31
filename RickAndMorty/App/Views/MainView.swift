//
//  MainView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 25/7/23.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView {
            // Main content
            TabBarView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
