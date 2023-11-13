//
//  TabBarView.swift
//  RickAndMorty
//
//  Created by Juan Kevin Trujillo on 31/10/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("view_tabbar_home")
                    }
                    .tag(0)

                CharactersView()
                    .tabItem {
                        Image(systemName: "person.3.fill")
                        Text("view_tabbar_characters")
                    }
                    .tag(1)

                EpisodesView()
                    .tabItem {
                        Image(systemName: "film.fill")
                        Text("view_tabbar_episodes")
                    }
                    .tag(2)
            }
            .toolbarBackground(Color("TabViewBackgroundColor"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    TabBarView()
}
