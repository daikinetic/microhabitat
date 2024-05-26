
import SwiftUI

struct CycleInputViewController: View {

  @State private var kirometer: String = ""
  @FocusState var focus: Bool

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

        HStack(spacing: 12) {
          TextField("距離", text: $kirometer)
            .frame(width: 100, height: 56)
            .font(.title2)
            .background {
              RoundedRectangle(cornerRadius: 16)
                .frame(width: 100, height: 56)
                .foregroundColor(.white)
            }
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .focused($focus)

          Text("km")
            .frame(width: 40, height: 40)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
        }
        .padding(.bottom, 200)


        RoundedRectangle(cornerRadius: 16)
          .frame(maxWidth: 340, maxHeight: 56)
          .foregroundColor(.white)
          .overlay(alignment: .center) {
            NavigationLink("コースを提案する", value: Int(kirometer))
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
    .gesture(
      TapGesture()
        .onEnded { _ in
          focus = false
        }
    )

  }
}

#Preview {
  MainTabView(selectedTab: 0)
}
