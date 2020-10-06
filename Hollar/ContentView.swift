//
//  ContentView.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            NearbyScreen()
                .tabItem {
                    Image(systemName: "map")
                    Text("Nearby")
                }
            DealsScreen()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Deals")
                }
            SearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            RewardsScreen()
                .tabItem {
                    Image(systemName: "star")
                    Text("Rewards")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
