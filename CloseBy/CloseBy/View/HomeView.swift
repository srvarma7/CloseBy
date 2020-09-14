//
//  HomeView.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 13/9/20.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    private let locationMgr = LocationManager()
    @State private var searchTerm: String = ""
    
    private func getCloseBy() {
        guard let location = locationMgr.location else {
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.searchTerm
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        let search = MKLocalSearch(request: request)
        search.start { (resp, err) in
            guard let response = resp, err == nil else { return }
            
            let items = response.mapItems
            items.map {
                print($0.name)
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapViewRepresentable()
                .ignoresSafeArea()
            
            TextField("Search here", text: $searchTerm, onCommit: {
                getCloseBy()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
