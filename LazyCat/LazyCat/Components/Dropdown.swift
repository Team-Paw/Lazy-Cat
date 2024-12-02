//
//  Dropdown.swift
//  LazyCat
//
//  Created by jinlee on 11/27/24.
//
import SwiftUI

struct Dropdown: View {
    @State private var isExpanded: Bool = false // 드롭다운 열림 상태
    @State var selectedOption: String // 현재 선택된 옵션
    let options: [String] // 드롭다운 옵션 목록
    var width: CGFloat // 버튼과 드롭다운 너비
    var height: CGFloat = 40 // 버튼과 드롭다운 높이 (기본값)

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
                .padding(.horizontal)
                .frame(width: width, height: height) // 버튼 크기
                .background(isExpanded ? Color("gray") : Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("dark"), lineWidth: 1)
                )
            }

            // 드롭다운 목록
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            withAnimation {
                                selectedOption = option // 선택된 옵션 업데이트
                                isExpanded.toggle() // 드롭다운 닫기
                            }
                        }) {
                            HStack {
                                Text(option)
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .frame(width: width, height: height) // 드롭다운 항목 크기
                            .background(selectedOption == option ? Color("gray").opacity(0.2) : Color.white)
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("dark"), lineWidth: 1)
                )
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isExpanded)
    }
}

// MARK: - Preview
struct Dropdown_Preview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Dropdown(
                selectedOption: "월",
                options: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                width: 80, // 버튼과 드롭다운 너비
                height: 50  // 버튼과 드롭다운 높이
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
