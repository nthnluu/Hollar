//
//  AccountScreen.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import FirebaseAuth



struct AccountScreen: View {
    @Binding var isOpen: Bool
    @EnvironmentObject var isAuth: UserAuth
    
    func signOut() -> Void {
        do {
            try Auth.auth().signOut()
            self.isAuth.isAuthenticated = false
            self.isOpen = false
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    let menuData: [SettingsMenuOption] = [SettingsMenuOption(label: "hello"), SettingsMenuOption(label: "Sign out")]
    
    
    
    
    var body: some View {
        NavigationView {
            List(menuData) { item in
                Button(action: {signOut()}) {
                    HStack {
                        Text("Sign out")
                    }
                }
            }
            .navigationBarTitle("Account")
            .navigationBarItems(leading:
                                    Button(action: {self.isOpen = false}) {
                                        Text("Back")
                                        
                                    }
            )
            
        }
    }
}

struct AccountScreenPreview: View {
    @State var testIsOpen: Bool = true
    
    var body: some View {
        AccountScreen(isOpen: $testIsOpen)
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreenPreview()
    }
}
