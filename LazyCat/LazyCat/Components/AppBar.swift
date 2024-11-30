//
//  AppBar.swift
//  LazyCat
//
//  Created by jinlee on 11/4/24.
//
import SwiftUI

struct AppUsageCard: View {
    var appIcon: Image // 앱 아이콘
    var appName: String // 앱 이름
    var setTime: String // 설정 시간
    var usageTime: String // 사용 시간

    var body: some View {
        HStack(spacing: 20) {
            // 앱 아이콘
            appIcon
                .resizable()
                .frame(width: 40, height: 40) // 아이콘 크기
                .cornerRadius(8) // 모서리 둥글게

            Text(appName)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Color("dark"))

            Spacer() // 이름과 시간 정보 사이에 간격 추가
            
            // 설정 시간 및 사용 시간
            VStack(alignment: .leading, spacing: 5) {
                Text("설정 시간: \(setTime)")
                    .font(.system(size: 12))
                    .foregroundColor(Color("middleGray"))

                Text("사용 시간: \(usageTime)")
                    .font(.system(size: 12))
                    .foregroundColor(Color("middleGray"))
            }
        }
        .padding(.horizontal, 30) // 전체 HStack의 좌우 간격
        .padding(.vertical, 15)
        .frame(width: 350, height: 69)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("dark"), lineWidth: 1)
        )
    }
}

// MARK: - Preview
struct AppUsageCard_Previews: PreviewProvider {
    static var previews: some View {
        AppUsageCard(
            appIcon: Image("paw"),
            appName: "Instagram",
            setTime: "4시간",
            usageTime: "3시간 30분"
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
