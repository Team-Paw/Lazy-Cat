//
//  HamburgerMenuHeader.swift
//  LazyCat
//
//  Created by 김민지 on 11/22/24.
//

import SwiftUI

struct HamburgerMenuHeader: View {
    var body: some View {
        HStack {
            Image("paw")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        .padding(.top, 40)
        HStack {
            Text("USER")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .tint(.dark)
        }
        .padding(.top, 10)
        Rectangle() // 구분선
            .fill(.lightGray) // 색상 지정
            .frame(height: 2) // 높이를 설정하여 두께 조정
    }
}

#Preview {
    HamburgerMenuHeader()
}
