//
//  MainButton.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct MainButton: View {
    var text: String
    var imageName: String? = nil
    var width: CGFloat = 266 //(기본값)
    var height: CGFloat = 49
    var action: () -> Void
    @State private var isPressed: Bool = false
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                // 이미지가 있을 경우 표시
                if let imageName = imageName {
                    Image(systemName: imageName)
                        .foregroundColor(Color.black)
                }
                Text(text)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color("dark"))
            }
            .frame(width: width, height: height)
            .background(isPressed ? Color("babyPink") : Color("gray"))
            .cornerRadius(15)
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in self.isPressed = true })
                .onEnded({ _ in self.isPressed = false })
        )
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut(duration: 0.2), value: isPressed)
    }
}

// MARK: - Preview
struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            MainButton(text: "Login"){}
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
