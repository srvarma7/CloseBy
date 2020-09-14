//
//  MapViewCoordinator.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 14/9/20.
//

import Foundation
import MapKit

final class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapView: MapViewRepresentable
    
    init(mapView: MapViewRepresentable) {
        self.mapView = mapView
    }
}
