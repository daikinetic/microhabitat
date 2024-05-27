//
//  NoteWebView.swift
//  microhabitat
//
//  Created by Daiki Takano on 2024/05/28.
//

import SwiftUI

struct NoteWebView: View {
  var body: some View {
    if let url = URL(string: "https://note.com/dddaiki_/n/nb0a792878128") {
      WebView(url: url)
    }
  }
}

#Preview {
  NoteWebView()
}
