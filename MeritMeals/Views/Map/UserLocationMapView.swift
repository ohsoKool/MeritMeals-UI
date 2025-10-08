import MapKit
import SwiftUI

struct UserLocationMapView: View {
    @StateObject private var locationManager = LocationManager()

    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    var body: some View {
        Map(position: $cameraPosition) {
            if let userCoordinate = locationManager.userLocation {
                Marker(" 🌟 You", coordinate: userCoordinate)
            }
        }
//        .onChange(of: locationManager.userLocation) { newLocation in
//            if let newLocation {
//                // Move camera to follow the user
//                cameraPosition = .region(
//                    MKCoordinateRegion(
//                        center: newLocation,
//                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//                    )
//                )
//            }
//        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    UserLocationMapView()
}
