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
        Image(uiImage: UIImage(imageLiteralResourceName: "microhabitat_forest"))
          .resizable()
          .aspectRatio(contentMode: .fill)
          .overlay {
            Rectangle()
              .opacity(0.5)
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
          .frame(maxWidth: 340, maxHeight: 56)
          .foregroundColor(.white)
          .overlay(alignment: .center) {
            NavigationLink("サイクリングコースを提案する!", value: Int(kirometer))
              .foregroundColor(.black)
              .font(.title2)
              .fontDesign(.monospaced)
              .italic()
              .lineLimit(1)
              .padding(.horizontal, 12)
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
  MainTabView(selectedTab: 0)
}
