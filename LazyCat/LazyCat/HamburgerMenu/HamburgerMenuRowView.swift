//
//  HamburgerMenuRowView.swift
//  LazyCat
//
//  Created by 김민지 on 11/22/24.
//

import SwiftUI

struct HamburgerMenuRowView: View {
    let option: HamburgerMenuOptionModel
    @Binding var selectedOption: HamburgerMenuOptionModel?
    private var isSelected: Bool {
        return selectedOption == option
    }
    var body: some View {
        HStack {
            Spacer()
            Text(option.title)
                .foregroundColor(isSelected ? .dark : .dark)
            Spacer()
        }
        .padding(.leading)
        .frame(width: 200, height: 44)
        .background(isSelected ? .babyPink : .clear)
    }
}

#Preview {
    HamburgerMenuRowView(option: .logout,
                         selectedOption: .constant(.logout))
}
