//
//  User.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import Foundation

struct User {
    // UserDefaults로부터 저장된 사용자명 받아오기
    // 아직 저장 전이라면 default값 "대장" 받아오기
    static var name: String {
        get {
            UserDefaultsManager().userName
        }
        set { // 사용자명 변경되면 설정에서 보여주는 사용자명도 변경해주기 
            SettingList.settingList[0].desc = newValue
        }
    }
    static var selectedTamagotchi: Tamagotchi? = nil
}
