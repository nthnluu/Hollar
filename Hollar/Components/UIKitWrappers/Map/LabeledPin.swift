//
//  LabeledPin.swift
//  Hollar
//
//  Created by Nathan Luu on 10/4/20.
//

import SwiftUI
import MapKit
import FirebaseFirestoreSwift
import FirebaseFirestore

struct LabeledPin: UIViewRepresentable {
    @Binding var store: Store

    func makeUIView(context: Context) -> MKMarkerAnnotationView {
        let annotation = MKMarkerAnnotationView()
        annotation.co = CLLocationCoordinate2D(latitude: store.location.latitude, longitude: store.location.longitude)
        annotation.glyphText = store.title
    
        return annotation
    }

    func updateUIView(_ uiView: MKMarkerAnnotationView, context: Context) {
        uiView.coordinate = CLLocationCoordinate2D(latitude: store.location.latitude, longitude: store.location.longitude)
        uiView.title = store.title
    }
}

struct LabeledPin_Previews: PreviewProvider {
    static var previews: some View {
        LabeledPin(store: .constant(Store(id: "12", title: "Brightside Barber", location: GeoPoint(latitude: 32.908680, longitude: -117.111702))))
    }
}
