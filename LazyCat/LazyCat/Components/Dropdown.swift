//
//  Dropdown.swift
//  LazyCat
//
//  Created by jinlee on 11/27/24.
//
import SwiftUI

struct Dropdown: View {
    @State private var isExpanded: Bool = false // 드롭다운 열림 상태
    @State  var selectedOption: String  // 기본 선택 옵션
    let options: [String] // 드롭다운 옵션 목록

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // 토글 버튼
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .frame(width: 40, height: 10)
                .padding()
                .background(isExpanded ? Color("gray") : Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("dark"), lineWidth: 1)
                )
            }
            .zIndex(1)

            // 드롭다운 목록
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            withAnimation {
                                selectedOption = option
                                isExpanded.toggle()
                            }
                        }) {
                            Text(option)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(width: 40,  alignment: .center) // 가운데 정렬
                                .padding()
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10) // 전체 테두리
                        .stroke(Color("dark"), lineWidth: 1) // 테두리 색상과 굵기
                )
            }
        }
        .frame(maxWidth: .infinity)
        .animation(.easeInOut(duration: 0.2), value: isExpanded)
    }
}

// MARK: - Preview
struct Dropdown_Preview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Dropdown(selectedOption:"월" , options: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"])
        }
        .previewLayout(.sizeThatFits)
    }
}
