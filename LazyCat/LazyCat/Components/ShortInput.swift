//
//  shortInput.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//

import SwiftUI

struct InputFieldComponent: View {
    @State private var isFocused: Bool = false // 입력 상태 여부
    @State private var text: String = "" // 입력된 텍스트
    
    var body: some View {
        TextField("input", text: $text, onEditingChanged: { focused in
            self.isFocused = focused // 입력 상태 변경
        })
        .padding(.horizontal, 10)
        .frame(height: 43)
        .background(isFocused ? Color("babyPink") : Color.white) // 배경색 설정
        .cornerRadius(10) // 모서리 둥글기
        .frame(width: 127, height: 43)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("dark"), lineWidth: 2) // 테두리 설정
        )
        .foregroundColor(Color("gray")) // 텍스트 색상
        .font(.system(size: 15,weight: .bold))
        .multilineTextAlignment(.center)
    }
}

// MARK: - Preview
struct InputFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            InputFieldComponent()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
