//
//  Login.swift
//  LazyCat
//
//  Created by jinlee on 12/3/24.
//
import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String? = nil // 에러 메시지 상태

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Lazy Cat")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color("dark"))
                
                Text("Login")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(Color("dark"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 120)
            .padding(.bottom, 15)
            .padding(.leading, 40)
            
            Image("paw")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 15)
            
            VStack(spacing: 16) {
                LongInput(placeholder: "email", text: $email)
                SecureInput(placeholder: "password", text: $password)
            }
            
            MainButton(text: "Login", width: 266, height: 49) {
                if let error = validateFields() {
                    errorMessage = error // 에러 메시지 설정
                } else {
                    errorMessage = nil
                    performLogin()
                }
            }
            .padding(.top, 10)
            
            // 에러 메시지
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.system(size: 12))
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .background(Color.white.ignoresSafeArea())
    }
    
    // 유효성 검사
    private func validateFields() -> String? {
        if email.isEmpty {
            return "이메일을 입력해 주세요."
        }
        if password.isEmpty {
            return "비밀번호를 입력해 주세요."
        }
        if !isValidEmailAndPassword(email: email, password: password) {
            return "이메일 또는 비밀번호를 잘못 입력했습니다."
        }
        return nil
    }

    // 이메일,비밀번호 유효성 검사
    private func isValidEmailAndPassword(email: String, password: String) -> Bool {
        //임시계정
        let validEmail = "test@example.com"
        let validPassword = "password123"
        return email == validEmail && password == validPassword
    }

    // 로그인 수행
    private func performLogin() {
        print("로그인 성공! 다음 화면으로 이동합니다.")
        // 화면 전환 로직 추가
    }
}

// MARK: - Preview
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .previewDevice("iPhone 14")
    }
}
