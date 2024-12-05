//
//  Join.swift
//  LazyCat
//
//  Created by jinlee on 12/3/24.
//

import SwiftUI
import AuthenticationServices // 애플 로그인에 필요

struct Join: View {
    @State private var isLoginActive = false // 네비게이션 상태 관리
    @State private var isJoinEmailActive = false // JoinEmail 네비게이션 상태 관리

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
                    
                    // Apple 로그인 버튼
                    Button(action: {
                        startAppleSignIn()
                    }) {
                        MainButton(
                            text: "        Apple 로그인",
                            imageName: nil,
                            width: 266,
                            height: 49
                        ) {}
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
                    }

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
                    Button(action: {
                        isJoinEmailActive = true // JoinEmail 네비게이션 활성화
                    }) {
                        Text("email로 회원가입")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color("dark"))
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
            .background(Color.white.ignoresSafeArea())
            .navigationDestination(isPresented: $isLoginActive) {
                Login()
            }
            .navigationDestination(isPresented: $isJoinEmailActive) {
                JoinEmail()
            }
        }
    }

    // 애플 로그인 프로세스 시작
    private func startAppleSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = AppleSignInHandler()
        controller.presentationContextProvider = AppleSignInContextProvider()
        controller.performRequests()
    }
}

// MARK: - Apple Sign-In Handler
class AppleSignInHandler: NSObject, ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print("Apple ID 로그인 성공 - 사용자 ID: \(userIdentifier), 이름: \(String(describing: fullName)), 이메일: \(String(describing: email))")
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple ID 로그인 실패: \(error.localizedDescription)")
    }
}

// MARK: - Apple Sign-In Context Provider
class AppleSignInContextProvider: NSObject, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first { $0.isKeyWindow }!
    }
}

// MARK: - Preview
struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join()
            .previewDevice("iPhone 14")
    }
}
