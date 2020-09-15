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
    
    let landmarks: [Landmark]
    
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
        updateAnnotations(mapView: uiView)
    }

    private func updateAnnotations(mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let newAnnotations = landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(newAnnotations)
    }
}
