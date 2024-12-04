//
//  JoinEmail.swift
//  LazyCat
//
//  Created by jinlee on 12/3/24.
//
import SwiftUI

struct JoinEmail: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showError: Bool = false // 에러 메시지 표시 여부
    @State private var showLogin: Bool = false // Login 화면 표시 여부

    var body: some View {
        VStack(spacing: 20) {
            // 제목
            VStack(alignment: .leading, spacing: 0) {
                Text("Lazy Cat")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color("dark"))
                
                Text("Join")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(Color("dark"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 120)
            .padding(.bottom, 15)
            .padding(.leading, 40)
            
            // 입력 필드
            VStack(spacing: 16) {
                LongInput(placeholder: "name", text: $name)
                LongInput(placeholder: "email", text: $email)
                LongInput(placeholder: "password", text: $password)
                LongInput(placeholder: "password confirm", text: $confirmPassword)
            }
            
            // Join 버튼
            MainButton(text: "Join", width: 266, height: 49) {
                if fieldsAreValid() {
                    showLogin = true // Login 화면 표시
                } else {
                    showError = true // 에러 메시지 표시
                }
            }
            .padding(.top, 10)
            
            // 에러 메시지
            if showError {
                Text("모든 필드를 입력해 주세요.")
                    .font(.system(size: 12))
                    .foregroundColor(Color.red)
            }
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .background(Color.white.ignoresSafeArea())
        .fullScreenCover(isPresented: $showLogin) {
            Login() // Login 화면
        }
    }

    // 모든 필드 유효성 검사
    private func fieldsAreValid() -> Bool {
        return !name.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
}

// MARK: - Preview
struct JoinEmail_Previews: PreviewProvider {
    static var previews: some View {
        JoinEmail()
            .previewDevice("iPhone 14")
    }
}
