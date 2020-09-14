//
//  LandmarkAnnotation.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 14/9/20.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinates
    }
    
}
