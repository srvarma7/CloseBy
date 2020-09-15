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
    
    var body: some View {
     
        VStack(alignment: .leading) {
            
            HStack {
                Text("Results")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 40)
                    .frame(width: CSS().width, height: 50, alignment: .leading)
            }.background(Color.gray)
            
            List {
                ForEach(self.landmarks, id:\.id) { landmark in
                    Text(landmark.name)
                        .padding(.leading, 10)
                }
            }.offset(y: -18)
            
        }.cornerRadius(20)
    }
}

struct PlacemarkView_Previews: PreviewProvider {
    static var previews: some View {
        let landmark = Landmark(placemark: MKPlacemark())
        PlacemarkView(landmarks: [landmark])
    }
}
