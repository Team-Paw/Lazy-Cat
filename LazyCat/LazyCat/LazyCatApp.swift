//
//  LazyCatApp.swift
//  LazyCat
//
//  Created by 김민지 on 10/31/24.
//

import SwiftUI
import FamilyControls

@main
struct LazyCatApp: App {
    // 자식에게 전달해줄 FamlyViewModel StateObject 선언
    @StateObject var familyViewModel = FamilyViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(familyViewModel) // familyViewModel을 모든 자식 트리에 전달
        }
    }
}
