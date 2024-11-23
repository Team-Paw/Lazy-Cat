//
//  ContentView.swift
//  LazyCat
//
//  Created by 김민지 on 10/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .trailing) {
                    // 메뉴 옵션
                    TabView(selection: $selectedTab) {
                        Text("닉네임 변경")
                            .tag(0)
                        Text("비밀번호 변경")
                            .tag(1)
                        Text("로그아웃")
                            .tag(2)
                        Text("회원탈퇴")
                            .tag(3)
                    }
                    // 햄버거 메뉴
                    HamburgerMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            showMenu.toggle()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                                .tint(.dark)
                        })
                    }
                }
                
            }
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
