//
//  HomeScreen.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import FirebaseFirestore

struct HomeScreen: View {
    @State private var accountScreen: Bool = false;
    @State private var signInScreen: Bool = false;
    @State private var locationScreen: Bool = false;
    @State private var messangerScreen: Bool = false;
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                FeaturedCard(storeTitle: "Brightside Barber", caption: "Get any haircut for only $9", image: "barbershop")
                FeaturedCard(storeTitle: "C2C Tutoring", caption: "In person and virtual SAT tutoring", image: "tutoring")
                FeaturedCard(storeTitle: "Serban Fitness", caption: "Personal, one-on-one training for all ages!", image: "fitness")
                VStack(spacing: 6.0) {
                    FullWidthButton(label: "Redeem")
                    FullWidthButton(label: "Help and Support")
                    FullWidthButton(label: "Send Gift")
                }
                .padding(.vertical, 16.0)
                Rectangle()
                    .frame(height: 12)
                    .foregroundColor(.clear)
            }
            .padding(.horizontal)
            .navigationBarTitle("San Diexgo")
            .navigationBarItems(leading: HStack {
                if self.userAuth.isAuthenticated {
                    Button(action: {self.messangerScreen = true}) {
                        Image(systemName: "bubble.left")
                            .font(.system(size: 20))
                        
                    }
                    .fullScreenCover(isPresented: $messangerScreen, content: {
                        MessangerScreen(isOpen: $messangerScreen)
                    })
                }
            }, trailing:
                HStack {
                    Button(action: {self.locationScreen = true}) {
                        Image(systemName: "location")
                            .font(.system(size: 20))
                    }
                    .padding(.trailing, 6.0)
                    .sheet(isPresented: $locationScreen, content: {
                        LocationPopup()
                    })
                    if self.userAuth.isAuthenticated{
                        Button(action: {self.accountScreen = true}) {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 20))
                            
                        }
                        .sheet(isPresented: $accountScreen, content: {
                            AccountScreen(isOpen: $accountScreen)
                        })
                    } else {
                        Button(action: {self.signInScreen = true}) {
                            Text("Log in")
                            
                        }
                        .sheet(isPresented: $signInScreen, content: {
                            WelcomeScreen(isOpen: $signInScreen)
                        })
                        
                    }
                    
                }
            
            )
        }
        
        
        
    }
    
    
    
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
