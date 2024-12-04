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
                LongInput(placeholder: "password", text: $password)
            }
            
            MainButton(text: "Login", width: 266, height: 49) {
                print("Login button clicked")
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .background(Color.white.ignoresSafeArea())
    }
}

// MARK: - Preview
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .previewDevice("iPhone 14")
    }
}
