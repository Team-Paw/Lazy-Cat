//
//  LongInput.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct LongInput: View {
    var placeholder: String // 플레이스홀더 텍스트
    @Binding var text: String // 입력된 텍스트
    @State private var isFocused: Bool = false // 입력 상태 여부

    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { focused in
            self.isFocused = focused // 포커스 상태 변경
        })
        .padding(.horizontal, 20) // 텍스트와 양쪽 끝 여백
        .frame(height: 43) // 텍스트 박스 높이
        .background(Color.white) // 배경색
        .cornerRadius(10) // 둥근 모서리
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isFocused ? Color("pointPink") : Color.gray, lineWidth: 2) // 포커스에 따른 테두리 색상
        )
        .foregroundColor(Color("dark"))
        .frame(width: 266, height: 43)
        .font(.system(size: 15, weight: .regular))
        .textInputAutocapitalization(.never) // 자동 대문자화 비활성화
    }
}

// MARK: - Preview
struct LongInputComponent_Previews: PreviewProvider {
    @State static var text = "" // Preview용 State

    static var previews: some View {
        VStack(spacing: 20) {
            LongInput(placeholder: "이름 입력", text: $text)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
