//
//  WebView.swift
//  WebViewTu
//
//  Created by 김정윤 on 2022/09/24.
//

import Foundation
import SwiftUI
import WebKit

struct webView:UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        
        print("url!!!!!", url)
        if (url.scheme != "http" && url.scheme != "https") {
            print("url 스킴 오픈")
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("웹뷰 오픈")
          webView.load(request)
        }

        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<webView>) {
        print("!!! update")
    }
}
