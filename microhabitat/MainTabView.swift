
import SwiftUI

struct MainTabView: View {

  @State var selectedTab: Int

  var body: some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $selectedTab) {
        NoteWebView()
          .tag(0)
        MapView(distance: 20)
          .tag(1)
        CycleInputView()
          .tag(2)
      }
      .padding(.bottom, 26)

      ZStack(alignment: .bottom) {
        HStack {
          ForEach((TabItems.allCases), id: \.self) { item in
            Button {
              selectedTab = item.rawValue
            } label: {
              CleanTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
            }
          }
        }
        .padding(6)
      }
      .background(.white)
      .cornerRadius(16)
      .padding(.horizontal, 16)
    }
    .padding(.top, 56)
  }
}

extension MainTabView {
  func CleanTabItem(imageName: String, title: String, isActive: Bool) -> some View {
    HStack {
      Spacer()
      Image(imageName)
        .resizable()
        .renderingMode(.template)
        .foregroundColor(.black)
        .frame(width: 24, height: 24)
      if isActive {

        Text(title)
          .font(.system(size: 15))
          .foregroundColor(.black)
          .padding(.leading, 4)
      }
      Spacer()
    }
    .frame(width: isActive ? .infinity : 64, height: 62)
    .background(isActive ? Color(red: 14/255, green: 26/255, blue: 51/255).opacity(0.3) : .clear)
    .cornerRadius(12)
  }
}

enum TabItems: Int, CaseIterable {
  case microhabitat
  case cycle
  case log

  var title: String {
    switch self {
    case .microhabitat:
      "微環境"
    case .cycle:
      "サイクリング"
    case .log:
      "生息ログ"
    }
  }

  var iconName: String {
    switch self {
    case .microhabitat:
      "microhabitat_leaf"
    case .cycle:
      "bicycle"
    case .log:
      "log"
    }
  }
}

#Preview {
  MainTabView(selectedTab: 0)
}
