import Combine
import CoreLocation // Gives access to the user's Location Permissions
import Foundation // Gives Swift classes, datatypes etc

// We need SwiftUI to react automatically when the user's location updates - so LocationManager must conform to ObservableObject
// NSObject is required because CoreLocation uses Objective-C delegates.
final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    // Instantiating the CLLocationManager
    @Published var userLocation: CLLocationCoordinate2D?
//    Keeps track of whether the user has granted or denied permission.
    @Published var authorizationStatus: CLAuthorizationStatus?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        checkLocationAuthorization()
    }
}

extension LocationManager {
    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            authorizationStatus = .denied
        case .authorizedWhenInUse, .authorizedAlways:
            authorizationStatus = .authorizedWhenInUse
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
}

extension LocationManager {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = latestLocation.coordinate
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
