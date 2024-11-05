//
//  TopBarView.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//

import SwiftUI

// MARK: - TopBarView
struct TopBarView: View {
    var body: some View {
        HStack {
            // MARK: - Title Section
            Text("Lazy Cat")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .padding(.leading, 16)
            
            Spacer()
            
            // MARK: - Hamburger Menu Icon
            VStack(spacing: 4) {
                Rectangle()
                    .frame(width: 24, height: 2)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: 24, height: 2)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: 24, height: 2)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 16)
        }
        .frame(width: 393, height: 96)
        .background(Color(white: 0.95)) // Background color for TopBar
    }
}

// MARK: - Preview
struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView()
            .previewLayout(.sizeThatFits)
    }
}
