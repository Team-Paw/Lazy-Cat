//
//  LongInput.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct LongInput: View {
    @State private var isFocused: Bool = false // 입력 상태 여부
    @State private var text: String = "" // 입력된 텍스트
    
    var body: some View {
        TextField("input", text: $text, onEditingChanged: { focused in
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
        .frame(width: 266, height: 43)
        .font(.system(size: 15, weight: .regular))
        .foregroundColor(Color.gray) // 텍스트 색상
    }
}

// MARK: - Preview
struct LongInputComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            LongInput() // Default 상태
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
