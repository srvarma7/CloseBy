//
//  LocationManager.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 14/9/20.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    private let locationMng = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    fileprivate func setupLocationManager() {
        locationMng.delegate = self
        locationMng.desiredAccuracy = kCLLocationAccuracyBest
        locationMng.distanceFilter = kCLDistanceFilterNone
        locationMng.requestWhenInUseAuthorization()
        locationMng.startUpdatingLocation()
    }
    
    override init() {
        super.init()
        
        setupLocationManager()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
        guard let location = locations.last else { return }
        self.location = location
    }
    
}
