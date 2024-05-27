
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  let webView: WKWebView
  let url: URL

  init(url: URL) {
    self.webView = WKWebView(frame: .zero)
    self.url = url
  }

  func makeUIView(context: Context) -> WKWebView {
    webView
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {
    webView.load(URLRequest(url: url))
  }
}
