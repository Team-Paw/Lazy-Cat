//
//  HamburgerMenuOptionModel.swift
//  LazyCat
//
//  Created by 김민지 on 11/22/24.
//

import Foundation

enum HamburgerMenuOptionModel: Int, CaseIterable {
    case changeName
    case changePassword
    case logout
    case userDelete
    
    var title: String {
        switch self {
        case .changeName:
            return "닉네임 변경"
        case .changePassword:
            return "비밀번호 변경"
        case .logout:
            return "로그아웃"
        case .userDelete:
            return "회원탈퇴"
        }
    }
}

extension HamburgerMenuOptionModel: Identifiable {
    var id: Int {return self.rawValue}
}
