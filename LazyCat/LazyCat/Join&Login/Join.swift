//
//  Join.swift
//  LazyCat
//
//  Created by jinlee on 12/3/24.
//

import SwiftUI

struct Join: View {
    @State private var isLoginActive = false // 네비게이션 상태 관리

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    Text("Lazy Cat")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color("dark"))
                    
                    Text("Lazy Cat과 건강한 디지털 라이프")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color("dark"))
                }
                .padding(.top, 120)

                Image("paw")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .padding(.top, 10)

                VStack(spacing: 15) {
                    MainButton(text: "카카오 로그인", imageName: "message.fill", width: 266, height: 49) {
                        print("카카오 로그인")
                    }
                    
                    MainButton(
                        text: "        Apple 로그인",
                        imageName: nil,
                        width: 266,
                        height: 49
                    ) {
                        print("Apple 로그인")
                    }
                    .overlay(
                        HStack {
                            Image(systemName: "applelogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        .padding(.leading, 75)
                    )

                    // 이메일 로그인 버튼
                    MainButton(text: "email 로그인", imageName: "envelope.fill", width: 266, height: 49) {
                        isLoginActive = true // 네비게이션 활성화
                    }
                }
                .padding(.top, 20)

                HStack(spacing: 0) {
                    Text("계정이 없으시다면? ")
                        .font(.system(size: 12))
                        .foregroundColor(Color("dark"))
                    Text("회원가입")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color("dark"))
                }
                .padding(.bottom, 80)
            }
            .padding()
            .background(Color.white.ignoresSafeArea())
            .navigationDestination(isPresented: $isLoginActive) {
                Login()
            }
        }
    }
}

// MARK: - Preview
struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join()
            .previewDevice("iPhone 14")
    }
}
