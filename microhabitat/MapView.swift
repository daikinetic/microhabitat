
// ref: https://zenn.dev/oka_yuuji/articles/38afe965565002

import SwiftUI
import CoreData
import MapKit

struct MapView: View {

  @State private var cameraPosition: MapCameraPosition = .region(.myRegion)

  let distance: Int

  var body: some View {
    NavigationView {
      Map(position: $cameraPosition) {
        Annotation(coordinate: .myLocation) {
          Image("microhabitat_leaf")
            .resizable()
            .frame(width: 24, height: 24)
            .padding(8)
            .background(
              RoundedRectangle(cornerRadius: 8)
                .fill(.white)
            )
        } label: {
          Text("拠点")
        }
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

extension CLLocationCoordinate2D {
  static var myLocation: CLLocationCoordinate2D {
    .init(latitude: 35.6620, longitude: 139.4452)
  }
}

extension MKCoordinateRegion {
  static var myRegion: MKCoordinateRegion {
    .init(center: .myLocation, latitudinalMeters: 400, longitudinalMeters: 400)
  }
}

#Preview {
  MainTabView(selectedTab: 1)
}

