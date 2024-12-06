//
//  ContentView.swift
//  LazyCat
//
//  Created by 김민지 on 10/31/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showOnboardingWelcome = false // 첫 번째 온보딩 모달
    @State private var showOnboardingSetting = false // 두 번째 온보딩 모달
    
    var body: some View {
        VStack {
            TopBarView()
        }
        .onAppear {
            if !hasSeenOnboarding { // 온보딩이 표시된 적이 없으면 (앱에 최초 접속 시)
                showOnboardingWelcome = true // 첫 번째 모달 표시
            }
        }
        .sheet(isPresented: $showOnboardingWelcome) {
            OnboardingWelcome(
                showOnboardingWelcome: $showOnboardingWelcome,
                showOnboardingSetting: $showOnboardingSetting
            )
        }
        .sheet(isPresented: $showOnboardingSetting) {
            OnboardingSetting(showOnboardingSetting: $showOnboardingSetting)
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
