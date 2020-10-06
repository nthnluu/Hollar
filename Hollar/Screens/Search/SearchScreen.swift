import SwiftUI

struct SearchScreen: View {
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
            .navigationBarTitle("Search")
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchScreen()
        }
    }
}

