//
//  shortInput.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//

import SwiftUI

struct ShortInput: View {
    var placeholder: String // 플레이스홀더 텍스트
    @Binding var text: String // 입력된 텍스트 (외부에서 전달받음)
    @State private var isFocused: Bool = false // 입력 상태 여부

    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { focused in
            self.isFocused = focused // 입력 상태 변경
        })
        .padding(.horizontal, 10)
        .frame(height: 43)
        .background(isFocused ? Color("babyPink") : Color.white) // 클릭 시 배경색 변경
        .cornerRadius(10) // 모서리 둥글기
        .frame(width: 127, height: 43)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("dark"), lineWidth: 2) // 테두리 설정
        )
        .foregroundColor(Color("dark")) // 텍스트 색상
        .font(.system(size: 15, weight: .bold)) // 텍스트 스타일
        .multilineTextAlignment(.center) // 텍스트 중앙 정렬
    }
}

// MARK: - Preview
struct ShortInput_Previews: PreviewProvider {
    @State static var text = "" // Preview용 State
    
    static var previews: some View {
        VStack(spacing: 20) {
            ShortInput(placeholder: "이름 입력", text: $text)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
