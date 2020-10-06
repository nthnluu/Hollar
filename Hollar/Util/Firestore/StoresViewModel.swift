//import Foundation
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//import FirebaseDatabase
//import GeoFire
//
//
//struct Store: Codable, Identifiable {
//    @DocumentID var id: String? // (2)
//    var title: String
//    var location: GeoPoint
//}
//
//class StoresViewModel: ObservableObject {
//    @Published var stores = [Store]()
//
//    private var db = Firestore.firestore()
//    private var ref: DatabaseReference! = Database.database().reference()
//
//    func getDocumentNearBy(latitude: Double, longitude: Double, distance: Double) {
//        let geoFire = GeoFire(firebaseRef: ref)
//
//        let center = CLLocation(latitude: 32.9087, longitude: -117.112)
//        var query = geoFire.query(at: center, withRadius: 0.6)
//        query.observeReady({
//          print(query)
//        })
//
//
//        
//        db.collection("store").document("").getDocument(completion: <#T##FIRDocumentSnapshotBlock##FIRDocumentSnapshotBlock##(DocumentSnapshot?, Error?) -> Void#>)
//
//        query.addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.stores = documents.map { queryDocumentSnapshot -> Store in
//                let data = queryDocumentSnapshot.data()
//                let key = queryDocumentSnapshot.documentID
//                let title = data["title"] as? String ?? ""
//                let location = data["location"] as? GeoPoint ?? GeoPoint(latitude: 10.0, longitude: 10.0)
//                return Store(id: key, title: title, location: location)
//            }
//        }
//
//    }
//
//    func fetchData() {
//        db.collection("store").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.stores = documents.map { queryDocumentSnapshot -> Store in
//                let data = queryDocumentSnapshot.data()
//                let key = queryDocumentSnapshot.documentID
//                let title = data["title"] as? String ?? ""
//                let location = data["location"] as? GeoPoint ?? GeoPoint(latitude: 10.0, longitude: 10.0)
//                return Store(id: key, title: title, location: location)
//            }
//        }
//    }
//}
