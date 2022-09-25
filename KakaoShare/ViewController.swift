//
//  ViewController.swift
//  KakaoShare
//
//  Created by 김정윤 on 2022/09/24.
//

import Foundation
import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    // 웹뷰 목록 관리
    var webViews = [WKWebView]()
    
    /// ---------- 팝업 열기 ----------
    /// - 카카오 JavaScript SDK의 로그인 기능은 popup을 이용합니다.
    /// - window.open() 호출 시 별도 팝업 webview가 생성되어야 합니다.
    ///
    func webView(_ webView: WKWebView,
                 createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction,
                 windowFeatures: WKWindowFeatures
    ) -> WKWebView? {
        guard let frame = self.webViews.last?.frame else {
            return nil
        }

        // 웹뷰를 생성하여 리턴하면 현재 웹뷰와 parent 관계가 형성됩니다.
        return createWebView(frame: frame, configuration: configuration)
    }

    /// ---------- 팝업 닫기 ----------
    /// - window.close()가 호출되면 앞에서 생성한 팝업 webview를 닫아야 합니다.
    ///
    func webViewDidClose(_ webView: WKWebView) {
        destroyCurrentWebView()
    }

    // 웹뷰 생성 메서드 예제
    func createWebView(frame: CGRect, configuration: WKWebViewConfiguration) -> WKWebView {
        let webView = WKWebView(frame: frame, configuration: configuration)

        // set delegate
        webView.uiDelegate = self
        webView.navigationDelegate = self
                
        // 화면에 추가
        self.view.addSubview(webView)

        // 웹뷰 목록에 추가
        self.webViews.append(webView)

        // 그 외 서비스 환경에 최적화된 뷰 설정하기

        
        return webView
    }

    // 웹뷰 삭제 메서드 예제
    func destroyCurrentWebView() {
        // 웹뷰 목록과 화면에서 제거하기
        self.webViews.popLast()?.removeFromSuperview()
    }

}
