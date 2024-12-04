//
//  JoinEmail.swift
//  LazyCat
//
//  Created by jinlee on 12/3/24.
//
import SwiftUI

struct JoinView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
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
            
            MainButton(text: "Join", width: 266, height: 49) {
                print("Join button clicked")
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .background(Color.white.ignoresSafeArea())
    }
}

// MARK: - Preview
struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView()
            .previewDevice("iPhone 14")
    }
}
