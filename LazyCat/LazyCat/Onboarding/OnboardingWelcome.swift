//
//  OnboardingWelcome.swift
//  LazyCat
//
//  Created by 김민지 on 12/6/24.
//

import SwiftUI
import FamilyControls

struct OnboardingWelcome: View {
    @Binding var showOnboardingWelcome: Bool
    @Binding var showOnboardingSetting: Bool
    @EnvironmentObject var familyViewModel: FamilyViewModel


    var body: some View {
        VStack(spacing: 20) {
            Image("paw")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 55)
                .padding(.top, 40)
                .padding(.bottom, 35)
            
            Text("LazyCat에 오신 것을 환영합니다")
                .font(.system(size: 34))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20) // 텍스트 좌우 여백
                .padding(.bottom, 35)
            
            VStack(alignment: .leading, spacing: 30) {
                OnboardingItem(text: "화면 시간 제한 설정",
                               description: "화면 시간이 일일 제한에 도달한 후 앱을 제한합니다.")
                OnboardingItem(text: "안전 영역 및 제한 영역",
                               description: "영역을 벗어나거나 들어갈 때 앱을 자동으로 제한합니다.")
                OnboardingItem(text: "일",
                               description: "하루 중 특정 시간에 선택한 앱을 제한하거나 복원합니다.")
            }
            .padding(.horizontal, 15) // 리스트 전체 좌우 여백 추가

            Spacer()
            
            Button(action: {
                requestFamilyControlsAuthorization()
            }) {
                Text("허용")
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
    
    private func requestFamilyControlsAuthorization() {
        Task {
            do {
                // Family Controls 권한 요청
                try await familyViewModel.familyCenter.requestAuthorization(for: .individual)
                showOnboardingWelcome = false // 첫 번째 모달 닫기
                showOnboardingSetting = true // 두 번째 모달 표시
            } catch {
                print("Failed to request FamilyControls authorization: \(error)")
            }
        }
    }
}

struct OnboardingItem: View {
    let text: String
    let description: String

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 33))
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 5) {
                Text(text)
                    .font(.system(size: 15))
                    .fontWeight(.bold)

                Text(description)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: true, vertical: false)

            }
        }
    }
}


#Preview {
    OnboardingWelcome(
        showOnboardingWelcome: .constant(true),
        showOnboardingSetting: .constant(false)
    )
    .environmentObject(FamilyViewModel())
}

