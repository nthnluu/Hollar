//
//  WelcomeScreen.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import FirebaseAuth

struct WelcomeScreen: View {
    @Binding var isOpen: Bool
    @EnvironmentObject var isAuth: UserAuth
    
    var provider = OAuthProvider(providerID: "github.com")
    
    func signInWithGithub() -> Void {
        provider.getCredentialWith(nil) { credential, error in
              if error != nil {
                // Handle error.
              }
              if credential != nil {
                Auth.auth().signIn(with: credential!) { authResult, error in
                  if error != nil {
                    // Handle error.
                  } else {
                    self.isAuth.isAuthenticated = true
                    self.isOpen = false
                  }
                  // User is signed in.
                  // IdP data available in authResult.additionalUserInfo.profile.
                  // GitHub OAuth access token can also be retrieved by:
                  // authResult.credential.accessToken
                  // GitHub OAuth ID token can be retrieved by calling:
                  // authResult.credential.idToken
                }
              }
            }
    }
    
    var body: some View {
        NavigationView {
            HStack {
                Button(action: {signInWithGithub()}) {
                    Text("Sign in with Github")
                }
            }
                .navigationBarTitle("Welcome to Hollar")
                .navigationBarItems(leading: Button(action: {self.isOpen = false}) {
                    Image(systemName: "multiply")
                        .font(.system(size: 24))
                    
                })
        }
        
    }
}

struct WelcomeScreenPreview: View {
    @State private var testIsOpen: Bool = true
    
    var body: some View {
        WelcomeScreen(isOpen: $testIsOpen)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenPreview()
    }
}
