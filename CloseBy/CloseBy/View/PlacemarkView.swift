//
//  PlacemarkView.swift
//  CloseBy
//
//  Created by Sai Raghu Varma Kallepalli on 15/9/20.
//

import SwiftUI
import MapKit

struct CSS {
    let bounds = UIScreen.main.bounds
    let height = UIScreen.main.bounds.height
    let width  = UIScreen.main.bounds.width
}

struct PlacemarkView: View {
    
    let landmarks: [Landmark]
    let tapGesture: () -> ()
    
    var body: some View {
     
        VStack(alignment: .leading) {
            
            HStack {
                Text("Results")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 30)
                    .frame(width: CSS().width, height: 60, alignment: .leading)
            }.background(Color.gray)
            .gesture(TapGesture()
                        .onEnded(tapGesture)
            )
            
            PlacemarkListView(landmarks: landmarks)
            
        }.cornerRadius(20)
    }
}

struct PlacemarkListView: View {
    
    let landmarks: [Landmark]
    
    var body: some View {
        List {
            ForEach(self.landmarks, id:\.id) { landmark in
                Text(landmark.name)
                    .padding(.leading, 5)
            }
        }.offset(x: 0, y: -20)
    }
     
}

struct PlacemarkView_Previews: PreviewProvider {
    static var previews: some View {
        let landmark = Landmark(placemark: MKPlacemark())
        PlacemarkView(landmarks: [landmark], tapGesture: {  })
    }
}
