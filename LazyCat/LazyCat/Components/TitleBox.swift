//
//  TitleBox.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct TitleWithSubtitle: View {
    var title: String // 제목
    var subtitle: String // 부제목
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 18, weight: .bold)) // 제목 스타일
                .foregroundColor(Color("dark"))
                .multilineTextAlignment(.leading)
            
            Text(subtitle)
                .font(.system(size: 10, weight: .bold)) // 부제목 스타일
                .foregroundColor(Color("middleGray"))
                .multilineTextAlignment(.leading)

        }
    }
}

// MARK: - Preview
struct TitleWithSubtitle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleWithSubtitle(
                title: "월간 사용 비율",
                subtitle: "날짜를 클릭해 상세 조회해보세요"
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
