//
//  HollarApp.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import Firebase
import CoreLocation

class UserAuth: ObservableObject {
    @Published var isAuthenticated = false
}


@main
struct HollarApp: App {
    
    @ObservedObject var userAuth = UserAuth()
    @ObservedObject var viewModel = NearbyPointsViewModel()
    
    
    init() {
        FirebaseApp.configure()
        if Auth.auth().currentUser != nil {
          // User is signed in.
          // ...
            self.userAuth.isAuthenticated = true
        } else {
          // No user is signed in.
          // ...
            self.userAuth.isAuthenticated = false
        }
        viewModel.fetchData(center: CLLocation(latitude: 32.7526, longitude: -117.1345))
    }
    
    
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userAuth)
                .environmentObject(viewModel)
        }
    }
}
