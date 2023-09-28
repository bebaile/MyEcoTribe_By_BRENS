import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let coordinates: CLLocationCoordinate2D
    let cityName: String

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = cityName

        uiView.addAnnotation(annotation)
        uiView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}

struct MapKITMatView: View {
    private let cityName: String
    @State private var coordinates: CLLocationCoordinate2D?
    @State private var isMapVisible = false

    init(cityName: String) {
        self.cityName = cityName
    }

    var body: some View {
        VStack {
            if isMapVisible {
                MapView(coordinates: coordinates ?? CLLocationCoordinate2D(latitude: 0, longitude: 0), cityName: cityName)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 2)
                            .blur(radius: 4)
                            .offset(x: 2, y: 2)
                            .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .top, endPoint: .bottom)))
                    )
            }
        }
        .onAppear {
            geocodeCity()
        }
        .edgesIgnoringSafeArea(.all)
    }

    private func geocodeCity() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cityName) { (placemarks, error) in
            if let placemark = placemarks?.first,
               let location = placemark.location?.coordinate {
                self.coordinates = location
                isMapVisible = true // Afficher la carte lorsque les coordonnées sont disponibles
            } else {
                // Gérer les erreurs de géocodage
                print("Impossible de géocoder la ville.")
            }
        }
    }
}

struct MapKITMatView_Previews: PreviewProvider {
    static var previews: some View {
        MapKITMatView(cityName: "Paris")
    }
}
