//
//  Launch.swift
//  microhabitat
//
//  Created by Daiki Takano on 2024/05/22.
//

import SwiftUI

struct Launch: View {
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



        RoundedRectangle(cornerRadius: 16)
          .frame(width: 240, height: 56)
          .foregroundColor(.white)
          .opacity(0.45)
          .overlay(alignment: .center) {
            NavigationLink("microhabitat", value: 1)
              .foregroundColor(.black)
              .font(.title2)
              .fontDesign(.monospaced)
              .italic()
          }
          .padding(.bottom, 40)

      }
      .navigationDestination(for: Int.self) { _ in
        MapView()
      }

    }

  }
}

#Preview {
  Launch()
}
