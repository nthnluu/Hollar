//
//  HollarApp.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import Firebase

class UserAuth: ObservableObject {
    @Published var isAuthenticated = false
}


@main
struct HollarApp: App {
    
    var userAuth = UserAuth()
    
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
        
    }
    
    
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userAuth)
        }
    }
}
