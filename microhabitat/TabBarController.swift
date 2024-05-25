//
//  TabBarController.swift
//  microhabitat
//
//  Created by Daiki Takano on 2024/05/25.
//

import SwiftUI

struct MainTabView: View {

  @State var selectedTab = 0

  var body: some View {
    ZStack(alignment: .bottom) {
      TabView(selection: $selectedTab) {
        Launch()
          .tag(0)
        MapView(distance: 20)
          .tag(1)
        Launch()
          .tag(2)
      }

      ZStack {
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
      .frame(height: 72)
      .background(.purple.opacity(0.2))
      .cornerRadius(36)
      .padding(.horizontal, 24)
    }
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
        .frame(width: 32, height: 32)
      if isActive {

        Text(title)
          .font(.system(size: 24))
          .foregroundColor(.black)
          .padding(.leading, 4)
      }
      Spacer()
    }
    .frame(width: isActive ? .infinity : 64, height: 64)
    .background(.purple.opacity(0.4))
    .cornerRadius(32)
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
  MainTabView()
}
