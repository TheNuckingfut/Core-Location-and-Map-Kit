//
//  LocationCenter.swift
//  CoreLocationExample
//
//  Created by ashutosh deshpande on 12/12/2022.
//

import Foundation
import CoreLocation

final class LocationCenter: NSObject , CLLocationManagerDelegate {
    static let shared = LocationCenter()
    var locationManager: CLLocationManager!
    
    private override init() {
        locationManager = CLLocationManager()
    }
    
    func useStandradLocation() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = 100.0
        locationManager.distanceFilter = 100.0
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    
    func stopStandardLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func useSignificantLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter = 100.0
        locationManager.desiredAccuracy = 100.0
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func stopSignificantLocation() {
        locationManager.stopMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last as Any)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
