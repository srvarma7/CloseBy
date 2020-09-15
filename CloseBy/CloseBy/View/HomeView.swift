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
    @State private var isShowingLongResults = false
    
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
            
            PlacemarkView(landmarks: landmarks) {
                self.isShowingLongResults.toggle()
            }
            .frame(width: CSS().width, height: isShowingLongResults ? 550 : 250)
            .offset(y: calculateOffset())
            .animation(.spring())
            .padding()
        }
    }
    
    private func calculateOffset() -> CGFloat {
        print(UIScreen.main.bounds.height)
        print(UIScreen.main.bounds.width)
        print(UIScreen.main.bounds)
        if landmarks.count <= 0 {
            return UIScreen.main.bounds.height
        } else if isShowingLongResults {
            return UIScreen.main.bounds.height/3
        } else {
            return UIScreen.main.bounds.height - UIScreen.main.bounds.height/3
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
