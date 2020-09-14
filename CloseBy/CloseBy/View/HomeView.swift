//
//  HomeView.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 13/9/20.
//

import SwiftUI

struct HomeView: View {
    
    private let locationMgr = LocationManager()
    
    var body: some View {
        ZStack {
            MapViewRepresentable()
                .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
