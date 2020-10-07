import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseDatabase
import GeoFire


struct Store: Codable, Identifiable {
    @DocumentID var id: String? // (2)
    var title: String
    var location: GeoPoint
}

struct StoreCoordinate: Codable, Identifiable {
    @DocumentID var id: String? // (2)
    var location: GeoPoint
}

class NearbyPointsViewModel: ObservableObject {
    @Published var stores = [Store]()
    
    private var firestore = Firestore.firestore()
    private var dbRef: DatabaseReference! = Database.database().reference(withPath: "stores")
    
    func fetchData(center: CLLocation) {
        let geoFire = GeoFire(firebaseRef: dbRef)
        let circleQuery = geoFire.query(at: center, withRadius: 804.672)
        
        print("1: \(circleQuery)")
        
        var collectedItems = [StoreCoordinate]()
        
        var _ = circleQuery.observe(.keyEntered, with: { (key: String!, location: CLLocation!) in
            collectedItems.append(StoreCoordinate(id: key, location: GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)))
        })
        
        circleQuery.observeReady({
            print("3: \(collectedItems)")
            
            for querySet in collectedItems.chunked(into: 10) {
                let queryArr = querySet.map{qItem in
                    return qItem.id
                }
                
                self.firestore.collection("store").whereField(FieldPath.documentID(), in: queryArr)
                    .getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            
                            let resArray: [Store] = querySnapshot!.documents.map{ queryDocumentSnapshot -> Store in
                                let data = queryDocumentSnapshot.data()
                                let title = data["title"] as? String ?? ""
                                let location = data["location"] as? GeoPoint ?? GeoPoint(latitude: 10.0, longitude: -10.0)
                                
                                return Store(id: queryDocumentSnapshot.documentID, title: title, location: location)
                            }
                            
                            self.stores = self.stores + resArray
                            print(self.stores)
                        }
                    }
            }
        })
    }
    
    init() {
        fetchData(center: CLLocation(latitude: 32.7526, longitude: -117.1345))
    }
    
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

