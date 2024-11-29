//
//  DeleteButton.swift
//  LazyCat
//
//  Created by 김민지 on 11/28/24.
//

import SwiftUI

struct DeleteButton: View {
  @State private var isPresentingConfirm: Bool = false
    
    var body: some View {
        Button("Delete", role: .destructive) {
            isPresentingConfirm = true
        }
        .confirmationDialog("Are you sure?",
                            isPresented: $isPresentingConfirm) {
            Button("모두 삭제", role: .destructive) {
            }} message: {
                Text("정말 삭제하시겠습니까?")
            }
    }
}


#Preview {
    DeleteButton()
}
