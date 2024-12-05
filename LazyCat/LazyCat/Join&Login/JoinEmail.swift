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
    @State private var errorMessage: String? = nil // 에러 메시지
    @State private var showLogin: Bool = false // Login 화면 전환 여부

    var body: some View {
        NavigationStack {
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
                    if let error = validateFields() {
                        errorMessage = error // 에러 메시지 설정
                    } else {
                        errorMessage = nil
                        showLogin = true // Login 화면 전환 활성화
                    }
                }
                .padding(.top, 10)
                
                // 에러 메시지
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .font(.system(size: 12))
                        .foregroundColor(Color.red)
                }
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .background(Color.white.ignoresSafeArea())
            .navigationDestination(isPresented: $showLogin) {
                Login() // Login 화면
            }
        }
    }

    // 모든 필드 유효성 검사
    private func validateFields() -> String? {
        if email.isEmpty {
            return "이메일을 입력해 주세요."
        }
        if !email.contains("@") {
            return "이메일 형식에 맞지 않는 메일 주소입니다. 다시 입력해 주세요."
        }
        if password.isEmpty {
            return "비밀번호를 입력해 주세요."
        }
        if !isValidPassword(password) {
            return "비밀번호는 영문 소문자, 숫자, 특수기호를 조합해서 8자 이상을 사용하세요."
        }
        if password != confirmPassword {
            return "비밀번호가 일치하지 않습니다."
        }
        return nil
    }

    // 비밀번호 유효성 검사
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}

// MARK: - Preview
struct JoinEmail_Previews: PreviewProvider {
    static var previews: some View {
        JoinEmail()
            .previewDevice("iPhone 14")
    }
}
