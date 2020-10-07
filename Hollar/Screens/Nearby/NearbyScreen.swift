//
//  NearbyScreen.swift
//  Hollar
//
//  Created by Nathan Luu on 10/3/20.
//

import SwiftUI
import MapKit
import Drawer
import FirebaseFirestore
import CoreLocation
import Combine


struct StorePoint: Identifiable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct NearbyScreen: View {
    @EnvironmentObject var viewModel: NearbyPointsViewModel
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 32.7526, longitude: -117.1345),
        span: MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35))
    
    @State private var bottomSheetShown = false
    @State var manager = CLLocationManager()
    @ObservedObject var locationManager = LocationManager()
    
   
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $coordinateRegion,
                showsUserLocation: true, annotationItems: viewModel.stores) { store in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: store.location.latitude, longitude: store.location.longitude)) {
                    VStack(spacing: 2) {
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 4.0)
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 32))
                                .padding(.all, 1.5)
                        }
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .opacity(0.95)
                                .cornerRadius(8.0)
                                .shadow(radius: 4.0)
                            Text(store.title)
                                .font(.system(size: 7.5))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.all, 2.0)
                        }
                        
                    }
                    
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            
            
            
            Drawer(heights: [225, UIScreen.main.bounds.height - 72]) {
                ZStack {
                    BlurView(style: .systemThickMaterial)
                        .cornerRadius(12)
                        .shadow(radius: 45)
                    VStack(alignment: .center) {
                        Spacer().frame(height: 9.0)
                        RoundedRectangle(cornerRadius: 3.0)
                            .foregroundColor(Color(UIColor.systemGray5))
                            .frame(width: 30.0, height: 5.0)
                        Spacer()
                    }
                }
            }.edgesIgnoringSafeArea(.vertical)
        }
        .onAppear() {
           
        }
    }
}




struct NearbyScreen_Previews: PreviewProvider {
    static var previews: some View {
        NearbyScreen()
    }
}
