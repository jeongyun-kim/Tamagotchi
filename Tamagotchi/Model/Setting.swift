//
//  Setting.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/9/24.
//

import Foundation

struct Setting {
    let leftIcon: String
    let title: String
    var desc: String?
}

struct SettingList {
    // User.name이 변경됐을 때 반영되도록 연산 프로퍼티 
    static var settingList: [Setting] {
        return [
            Setting(leftIcon: ButtonImageType.userNameChange.rawValue, title: "내 이름 설정하기", desc: "\(User.name)"),
            Setting(leftIcon: ButtonImageType.tamagotchiChange.rawValue, title: "다마고치 변경하기", desc: nil),
            Setting(leftIcon: ButtonImageType.reset.rawValue, title: "데이터 초기화", desc: nil) 
        ]
        
    }
}
