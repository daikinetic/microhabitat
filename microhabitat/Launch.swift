//
//  Launch.swift
//  microhabitat
//
//  Created by Daiki Takano on 2024/05/22.
//

import SwiftUI

struct Launch: View {

  @State private var kirometer: String = ""

  var body: some View {
    NavigationStack {
      ZStack(alignment: .bottom) {
        Image(uiImage: UIImage(imageLiteralResourceName: "microhabitat"))
          .resizable()
          .aspectRatio(contentMode: .fill)
          .ignoresSafeArea()
          .overlay {
            Rectangle()
              .opacity(0.5)
              .ignoresSafeArea()
          }

        TextField("distance / km", text: $kirometer)
          .frame(width: 200, height: 50)
          .font(.title2)
          .background {
            RoundedRectangle(cornerRadius: 16)
              .frame(width: 240, height: 56)
              .foregroundColor(.white)
          }
          .padding(.bottom, 200)

        RoundedRectangle(cornerRadius: 16)
          .frame(width: 240, height: 56)
          .foregroundColor(.white)
          .opacity(0.45)
          .overlay(alignment: .center) {
            NavigationLink("microhabitat", value: Int(kirometer))
              .foregroundColor(.black)
              .font(.title2)
              .fontDesign(.monospaced)
              .italic()
          }
          .padding(.bottom, 40)

      }
      .navigationDestination(for: Int.self) { distance in
        MapView(distance: distance)
      }

    }

  }
}

#Preview {
  Launch()
}
