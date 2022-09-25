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
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void ) {
        print(navigationAction.request.url?.absoluteString ?? "")

        // 카카오 SDK가 호출하는 커스텀 URL 스킴인 경우 open(_ url:) 메서드를 호출합니다.
        if let url = navigationAction.request.url , ["kakaolink"].contains(url.scheme) {

            // 카카오톡 실행 가능 여부 확인 후 실행
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                 
                   //앱 미설치시 앱스토어로 연결
                if let openStore = URL(string: "itms-apps://itunes.apple.com/app/362057947"), UIApplication.shared.canOpenURL(openStore) {
                    UIApplication.shared.open(openStore, options: [:], completionHandler: nil)
                }
                
            }
            
            decisionHandler(.cancel); return
        } else {
            
            //앱 미설치시 앱스토어로 연결
         if let openStore = URL(string: "itms-apps://itunes.apple.com/app/362057947"), UIApplication.shared.canOpenURL(openStore) {
             UIApplication.shared.open(openStore, options: [:], completionHandler: nil)
         }
         
     }

        // 서비스에 필요한 나머지 로직을 구현합니다.
        decisionHandler(.allow)
    }
}
