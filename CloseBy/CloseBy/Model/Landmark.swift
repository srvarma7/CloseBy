//
//  Landmark.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 14/9/20.
//

import Foundation
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        UUID()
    }
    
    var name: String {
        placemark.name ?? ""
    }
    
    var title: String {
        placemark.title ?? ""
    }
    
    var coordinates: CLLocationCoordinate2D {
        placemark.coordinate
    }
    
}
