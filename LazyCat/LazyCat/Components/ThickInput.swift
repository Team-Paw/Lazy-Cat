//
//  ThickInput.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct ThickInputComponent: View {
    @State private var isFocused: Bool = false
    @State private var text: String = ""
    
    var body: some View {
        TextField("input", text: $text, onEditingChanged: { focused in
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
        .foregroundColor(Color("dark"))
    }
}

// MARK: - Preview
struct ThickInputComponent_Preview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            ThickInputComponent()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

