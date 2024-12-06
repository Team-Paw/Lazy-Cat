//
//  SecureInput.swift
//  LazyCat
//
//  Created by jinlee on 12/6/24.
//
import SwiftUI

struct SecureInput: View {
    var placeholder: String
    @Binding var text: String
    @FocusState private var isFocused: Bool // Focus 상태 추적

    var body: some View {
        SecureField(placeholder, text: $text)
            .focused($isFocused)
            .padding(.horizontal, 20) 
            .frame(height: 43)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isFocused ? Color("pointPink") : Color.gray, lineWidth: 2) // 포커스에 따른 테두리 색상
            )
            .foregroundColor(Color("dark"))
            .frame(width: 266, height: 43)
            .font(.system(size: 15, weight: .regular)) 
    }
}


// MARK: - Preview
struct SecureInput_Previews: PreviewProvider {
    @State static var text = "" // Preview용 State

    static var previews: some View {
        SecureInput(placeholder: "password", text: $text)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
