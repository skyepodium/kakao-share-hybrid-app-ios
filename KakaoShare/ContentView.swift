//
//  ContentView.swift
//  KakaoShare
//
//  Created by 김정윤 on 2022/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//             연동할 웹뷰 도메인 입력
//            webView(url: URL(string: "https://talk-apps.kakao.com/scheme/kakaolink")!)
//            webView(url: URL(string: "itms-apps://itunes.apple.com/app/id362057947")!)
//            webView(url: URL(string: "https://itunes.apple.com/kr/app/kakaotog-kakaotalk/id362057947?mt=8")!)
            webView(url: URL(string: "http://kakao-share.s3-website.ap-northeast-2.amazonaws.com/")!)
//            webView(url: URL(string: "https://www.google.com")!)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
