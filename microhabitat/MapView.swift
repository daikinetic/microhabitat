
// ref: https://zenn.dev/oka_yuuji/articles/38afe965565002

import SwiftUI
import CoreData
import MapKit

struct MapView: View {

  let distance: Int

  var body: some View {
    NavigationView {
      Map() {

      }
      .onAppear {
        print("distance: \(distance)")
      }
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
  MainTabView(selectedTab: 1)
}
