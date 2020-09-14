//
//  MapViewRepresentable.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 13/9/20.
//

import Foundation
import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        //
    }
    
    func makeUIView(context: Context) -> MKMapView {
        //
        let mapView = MKMapView()
        //mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        return mapView
  
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
}
