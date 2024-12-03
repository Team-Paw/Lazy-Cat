//
//  Join.swift
//  LazyCat
//
//  Created by jinlee on 12/3/24.
//

import SwiftUI

struct Join: View {
    var body: some View {
        VStack(spacing: 20) {
            // 제목과 부제목
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
                .frame(width: 200, height: 200)
                .padding(.top, 10)

            // 로그인 버튼
            VStack(spacing: 15) {
                MainButton(text: "카카오 로그인", imageName: "message.fill",width: 266, height: 49) {
                    print("카카오 로그인")
                }
                
                //애플로고만 크기가 다른 관계로 따로 조정
                MainButton(
                    text: "        Apple 로그인",
                    imageName: nil, // 이미지 직접 전달로 설정
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
                            .frame(width: 20, height: 20) // 애플 로고 크기 조정
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    .padding(.leading, 75) // 내부 여백 조정
                )
                
                MainButton(text: "email 로그인",imageName: "envelope.fill",  width: 266, height: 49) {
                    print("이메일 로그인")
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
    }
}


// MARK: - Preview
struct Join_Previews: PreviewProvider {
    static var previews: some View {
       Join()
            .previewDevice("iPhone 14")
    }
}
