//
//  OnboardingSetting.swift
//  LazyCat
//
//  Created by 김민지 on 12/6/24.
//

import SwiftUI

struct OnboardingSetting: View {

    var body: some View {
        VStack(spacing: 20) {
            Image("paw")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 55)
                .padding(.top, 40)
                .padding(.bottom, 35)
            
            Text("일일 목표 설정")
                .font(.system(size: 34))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20) // 텍스트 좌우 여백
                .padding(.bottom, 35)
            
            Text("하루 목표를 설정해주세요. 요일별로 원하는 목표 시간을 설정할 수 있습니다.")
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20) // 텍스트 좌우 여백

            Spacer()
            Text("목표 시간")
                .font(.system(size: 18))
            // 구현 필요

            Spacer()
            
            Button(action: {
//                requestFamilyControlsAuthorization()
//                hasSeenOnboarding = true // 온보딩 완료 상태 저장
            }) {
                Text("완료")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    OnboardingSetting()
}
