//
//  ThickInput.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct ThickInput: View {
    var placeholder: String // 플레이스홀더 텍스트
    @Binding var text: String // 입력된 텍스트
    @State private var isFocused: Bool = false // 포커스 상태

    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { focused in
            self.isFocused = focused // 포커스 상태 변경
        })
        .padding(.horizontal, 20) // 텍스트와 양쪽 끝 여백
        .frame(height: 57) // 텍스트 박스 높이
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isFocused ? Color("pointPink") : Color("dark"), lineWidth: 2) // 포커스에 따른 테두리 색상
        )
        .frame(width: 252, height: 57)
        .font(.system(size: 15, weight: .bold))
        .foregroundColor(Color("dark")) // 텍스트 색상
    }
}

// MARK: - Preview
struct ThickInputComponent_Preview: PreviewProvider {
    @State static var text = "" // Preview용 State

    static var previews: some View {
        VStack(spacing: 20) {
            ThickInput(placeholder: "이름 입력", text: $text)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
