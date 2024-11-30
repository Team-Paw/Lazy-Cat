//
//  BottomBarView.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

//struct ContentView: View {
//    @State private var selectedTab: Tab = .home // 현재 선택된 탭 상태
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Spacer() // 메인 콘텐츠 영역
//            
//            // 하단 탭바
//            BottomBarView(selectedTab: $selectedTab)
//        }
//    }
//}

// 하단 탭바
struct BottomBarView: View {
    @Binding var selectedTab: Tab

    var body: some View {
            VStack(spacing: 0) {
                // 회색 선 추가
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.gray.opacity(0.5)) // 선의 색상 및 투명도 설정
                
                // 탭바 아이템
                HStack {
                    BottomBarItem(iconName: "house", text: "HOME", tab: .home, selectedTab: $selectedTab)
                    BottomBarItem(iconName: "iphone", text: "TIME", tab: .time, selectedTab: $selectedTab)
                    BottomBarItem(iconName: "flag", text: "GOAL", tab: .goal, selectedTab: $selectedTab)
                    BottomBarItem(iconName: "chart.bar", text: "STATISTIC", tab: .statistic, selectedTab: $selectedTab)
                }
                .frame(height: 60)
            }
        }
}

// 개별 탭 아이템
struct BottomBarItem: View {
    let iconName: String
    let text: String
    let tab: Tab
    @Binding var selectedTab: Tab

    var body: some View {
        Button(action: {
            selectedTab = tab // 선택된 탭 업데이트
        }) {
            VStack(spacing: 4) {
                Image(systemName: iconName) // 아이콘
                    .font(.system(size: 25))
                    .foregroundColor(selectedTab == tab ? .black : .gray) // 선택 상태에 따라 색상 변경
                Text(text)
                    .font(.system(size: 12, weight: .bold))                    .foregroundColor(selectedTab == tab ? .black : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// 탭 열거형
enum Tab {
    case home
    case time
    case goal
    case statistic
}

// 미리보기
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
