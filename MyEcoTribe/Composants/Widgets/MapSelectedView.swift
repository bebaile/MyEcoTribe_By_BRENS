//
//  MapSelectedView.swift
//  MyEcoTribe
//
//  Created by Sylvain Leguay on 27/09/2023.
//

import SwiftUI
import MapKit

struct MapSelectedView: View {
        @Binding var selectedLocation: CLLocationCoordinate2D?
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        @Binding var cityName: String
        
        func reverseGeocode(latitude: Double, longitude: Double, completion: @escaping (String?) -> Void) {
            let location = CLLocation(latitude: latitude, longitude: longitude)
            let geocoder = CLGeocoder()

            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error {
                    print("Error reverse geocoding location: \(error.localizedDescription)")
                    completion(nil)
                } else if let placemark = placemarks?.first {
                    if let city = placemark.locality {
                        completion(city)
                    } else {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
        }
        
        var body: some View {
            VStack {
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .onAppear {
                        if let location = selectedLocation {
                            region.center = location
                            reverseGeocode(latitude: location.latitude, longitude: location.longitude) { cityName in
                                self.cityName = cityName ?? ""
                            }
                        }
                    }
                    .onTapGesture {
                        // Handle tap on the map, e.g., deselect any existing pin
                        selectedLocation = nil
                        cityName = ""
                    }
                    .gesture(longPressGesture())
                
//                if !cityName.isEmpty {
//                    Text("City: \(cityName)")
//                            .padding()
//                }
               
                
            }.cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 2) // Couleur et épaisseur de la ligne de l'ombre
                        .blur(radius: 4) // Flou de l'ombre
                        .offset(x: 2, y: 2) // Décalage de l'ombre par rapport au rectangle
                        .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .top, endPoint: .bottom))))
            .edgesIgnoringSafeArea(.all)
        }
        
        func longPressGesture() -> some Gesture {
            LongPressGesture(minimumDuration: 0.5)
                .onEnded { _ in
                    let touchPoint = region.center
                    selectedLocation = touchPoint
                    region.center = touchPoint
                    reverseGeocode(latitude: touchPoint.latitude, longitude: touchPoint.longitude) { cityName in
                        self.cityName = cityName ?? ""
                    }
                }
        }
    
}

struct MapSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        let initialLocation = CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333)
        @State var city = "Paris"
        return MapSelectedView(selectedLocation: .constant(initialLocation), cityName: $city)
    }
}
