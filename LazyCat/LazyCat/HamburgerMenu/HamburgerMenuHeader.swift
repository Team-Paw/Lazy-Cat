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
                .frame(width: 70, height: 70)
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
        Divider()
    }
}

#Preview {
    HamburgerMenuHeader()
}
