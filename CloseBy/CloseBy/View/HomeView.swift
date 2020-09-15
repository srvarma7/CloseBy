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
    @State private var landmarks = [Landmark]()
    
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
            self.landmarks = items.map {
                Landmark(placemark: $0.placemark)
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapViewRepresentable(landmarks: landmarks)
                .ignoresSafeArea()
            
            TextField("Search here", text: $searchTerm, onCommit: {
                getCloseBy()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: UIScreen.main.bounds.width - 40)
            .padding()
            
            PlacemarkView(landmarks: landmarks)
                .offset(y: calculateOffset())
                .animation(.spring())
        }
    }
    
    private func calculateOffset() -> CGFloat {
        if landmarks.count <= 0 {
            return UIScreen.main.bounds.height/3
        } else {
            return UIScreen.main.bounds.height/3
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
