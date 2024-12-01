//
//  HamburgerMenuView.swift
//  LazyCat
//
//  Created by 김민지 on 11/22/24.
//

import SwiftUI
struct HamburgerMenuView: View {
    @Binding var isShowing: Bool // 햄버거메뉴 표시 여부
    @Binding var selectedTab: Int // 선택된 탭의 인덱스 값
    @State private var selectedOption: HamburgerMenuOptionModel? // 현재 선택된 메뉴 옵션
    
    var body: some View {
        ZStack {
            if isShowing {
                // 햄버거 메뉴 표시될 때 뒷 화면에 회색 반투명 레이어 추가
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { // 햄버거 메뉴 외의 영역을 터치하면 닫히도록
                        isShowing.toggle()
                    }
                
                // 햄버거 메뉴 레이아웃 구성
                HStack {
                    Spacer() // 햄버거 메뉴 오른쪽에 배치
                    VStack(spacing: 32){ // spacing은 햄버거 메뉴 내 요소들 간의 간격
                        HamburgerMenuHeaderView() // 헤더 (발바닥 로고 & 유저네임)
                        
                        // 햄버거 메뉴의 모든 옵션 표시 (4개)
                        VStack {
                            ForEach(HamburgerMenuOptionModel.allCases) {
                                option in Button(action: {
                                    onOptionTapped(option)
                                }, label: {
                                    HamburgerMenuRowView(option: option, selectedOption: $selectedOption)
                                })
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 200, alignment: .center)
                    .background(.white)
                }
                .transition(.move(edge: .trailing))
            }
        }
        .transition(.move(edge: .leading)) // 햄버거 메뉴가 오른쪽에서 나타나고 사라짐
        .animation(.easeInOut, value: isShowing) // 부드럽게
    }
    
    // 햄버거 메뉴 옵션이 선택 되었을 때 실행되는 함수
    private func onOptionTapped(_ option: HamburgerMenuOptionModel) {
        // 변수 값 업데이트
        selectedOption = option
        selectedTab = option.rawValue
        
        isShowing = false // 햄버거 메뉴 닫음
    }
}
#Preview {
    HamburgerMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}
