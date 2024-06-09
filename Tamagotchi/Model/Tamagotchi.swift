//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import Foundation

enum TamagotchiType: Int {
    case green = 1
    case orange
    case red
    case etc
}

struct Tamagotchi {
    let type: TamagotchiType
    let name: String
    
    // 레벨, 밥, 물방울은 다마고치를 변경하더라도 변경되지 않음 => 같은 값을 공유(static)
    // UserDefaults에 저장된 값 받아오기(없다면 자연스럽게 0으로)
    // 저장 프로퍼티로 쓰면 리셋됐을 때 바로 값을 반영하지 못해서 status값이 이전 데이터가 나옴
    // => 연산 프로퍼티로 사용해주기
    static var food: Int { return UserDefaultsManager().food }
    static var water: Int { return UserDefaultsManager().water }
    
    static var level: Int {
        let expToLevel = (food/5 + water/2)/10

        if expToLevel == 0 {
            return 1
        } else if expToLevel >= 10 {
            return 10
        } else {
            return expToLevel
        }
    }
    
    // 레벨과 상관없이 선택하기 화면에서 보여주는 이미지
    var mainImageName: String {
        return type == .etc ? "noImage" : "\(type.rawValue)-6"
        
    }
    
    // 레벨에 따라 변하는 이미지
    var imageName: String {
        if Tamagotchi.level == 10 {
            return "\(type.rawValue)-\(Tamagotchi.level-1)"
        } else {
            return "\(type.rawValue)-\(Tamagotchi.level)"
        }
    }
    
    var desc: String {
        switch type {
            case .green, .orange, .red:
                "저는 \(name)에용✨\n저는 노는게 제일 좋아용 \(User.name)도 그렇죵?\n밥이랑 물을 주면 무럭무럭 자라날거에요\n저를 선택해주실래용?"
            case .etc:
                "아직 준비 중"
        }
    }
    
    var status: String {
        return "LV\(Tamagotchi.level) | 밥알 \(Tamagotchi.food)개 | 물방울 \(Tamagotchi.water)개"
    }
}

extension Tamagotchi {
    static var list: [Tamagotchi] = [
        Tamagotchi(type: .green, name: "따끔따끔 다마고치"),
        Tamagotchi(type: .orange, name: "방실방실 다마고치"),
        Tamagotchi(type: .red, name: "반짝반짝 다마고치"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
        Tamagotchi(type:. etc, name: "준비중이에요"),
    ]
}
