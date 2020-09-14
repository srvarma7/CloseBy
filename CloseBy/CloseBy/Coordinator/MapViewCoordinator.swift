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
    let zoomDistance: CLLocationDistance = 2000
    
    init(mapView: MapViewRepresentable) {
        self.mapView = mapView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        //
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let zoomInRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: zoomDistance, longitudinalMeters: zoomDistance)
                    mapView.setRegion(zoomInRegion, animated: true)
                }
            }
        }
    }
}
