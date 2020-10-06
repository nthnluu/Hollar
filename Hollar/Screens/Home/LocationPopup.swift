//
//  LocationPopup.swift
//  Hollar
//
//  Created by Nathan Luu on 10/5/20.
//

import SwiftUI

struct LocationPopup: View {
    // Search string to use in the search bar
    @State var searchString = ""
    
    // Search action. Called when search key pressed on keyboard
    func search() {
    }
    
    // Cancel action. Called when cancel button of search bar pressed
    func cancel() {
    }
    
    let dataArray = ["hi", "mate"]
    
    // View body
    var body: some View {
        // Search Navigation. Can be used like a normal SwiftUI NavigationView.
        SearchNavigation(text: $searchString, search: search, cancel: cancel) {
            // Example SwiftUI View
            List() {
//                data in
//                Text(data)
            }
            .navigationBarTitle("Change location", displayMode: .inline)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct LocationPopup_Previews: PreviewProvider {
    static var previews: some View {
        LocationPopup()
    }
}
