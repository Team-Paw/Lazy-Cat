//
//  FamilyViewModel.swift
//  LazyCat
//
//  Description: FamilyControls 관련 로직을 처리하는 ViewModel
//
//  Created by 김민지 on 12/6/24.
//

import Foundation
import FamilyControls

class FamilyViewModel: ObservableObject {
    
    // Family Controls 권한 센터
    let familyCenter = AuthorizationCenter.shared
    
    // 선택된 앱 및 카테고리 목록을 관리
    @Published var appSelection = FamilyActivitySelection(includeEntireCategory: true)
}
