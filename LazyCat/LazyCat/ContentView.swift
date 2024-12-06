//
//  ContentView.swift
//  LazyCat
//
//  Created by 김민지 on 10/31/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showOnboarding = false // 모달 표시 여부 상태
    
    var body: some View {
        VStack {
            TopBarView()
            Home() // 홈화면 (임시)
        }
        .onAppear {
            if !hasSeenOnboarding { // 온보딩이 표시된 적이 없으면 (앱에 최초 접속 시)
                showOnboarding = true // 온보딩 모달 표시
            }
        }
        .sheet(isPresented: $showOnboarding) { // 모달로 표시되도록 함
            OnboardingWelcome(showOnboarding: $showOnboarding)
        }
    }
}
 
struct MainView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Main Content")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
