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
            // 연동할 웹뷰 도메인 입력
            webView(url: URL(string: "http://kakao-share.s3-website.ap-northeast-2.amazonaws.com/")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
