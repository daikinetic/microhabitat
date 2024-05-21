//
//  ContentView.swift
//  microhabitat
//
//  Created by Daiki Takano on 2024/05/06.
//

import SwiftUI
import CoreData
import MapKit

struct MapView: View {

  var body: some View {
    NavigationView {
      Map() {

      }
      .navigationTitle("microhabitat")
      .mapControls {
        MapCompass()
          .mapControlVisibility(.visible)
        MapPitchToggle()
          .mapControlVisibility(.visible)
        MapScaleView()
          .mapControlVisibility(.visible)
        MapUserLocationButton()
          .mapControlVisibility(.visible)
      }
      
    }
  }
}

#Preview {
  MapView()

}

