//
//  MapViewRepresentable.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 13/9/20.
//

import Foundation
import SwiftUI
import MapKit
import UIKit

struct MapViewRepresentable: UIViewRepresentable {
    
    func makeCoordinator() -> MapViewCoordinator {
        // Creating coordinator for delegate methods
        MapViewCoordinator(mapView: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        // Creating MapView
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
  
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Upadting mapview
    }
}
