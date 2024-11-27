//
//  ConfirmWindow.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct ConfirmPopup: View {
    var text: String
    var confirmAction: () -> Void // '네' 버튼 액션
    var cancelAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(text)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(Color("dark"))
            
            // 버튼 그룹
            HStack(spacing: 25) {
                MainButton(text: "네", width:73, height:40 ) {
                    confirmAction()
                }
                
                MainButton(text: "아니요",width:73, height:40) {
                    cancelAction()
                }
            }
        }
        .padding(30)
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("dark"), lineWidth: 2)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

// MARK: - Preview
struct ConfirmationPopup_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmPopup(
            text: "정말 삭제하시겠습니까?",
            confirmAction: { print("삭제 확인") },
            cancelAction: { print("삭제 취소") }
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
