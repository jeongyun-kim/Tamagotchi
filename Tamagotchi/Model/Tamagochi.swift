//
//  Tamagochi.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import Foundation

enum TamagochiType: Int {
    case green = 1
    case orange
    case red
    case etc
}

struct Tamagochi {
    let type: TamagochiType
    let name: String
    // 레벨, 밥, 물방울은 다마고치를 변경하더라도 변경되지 않음 => 같은 값을 공유 
    static var food: Double = 0
    static var water: Double = 0
    
    static var level: Int {
        let expToLevel = Int((food/5 + water/2)/10)
        
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
        var imageString = ""
        if Tamagochi.level == 10 {
            imageString = "\(type.rawValue)-\(Tamagochi.level-1)"
        } else {
            imageString = "\(type.rawValue)-\(Tamagochi.level)"
        }
        return type == .etc ? imageString : "noImage"
    }
    
    var desc: String {
        switch type {
            case .green, .orange, .red:
                "저는 \(name)에용✨\n저는 노는게 제일 좋아용 \(User.name)도 그렇죵?\n밥이랑 물을 주면 무럭무럭 자라날거에요\n저를 선택해주실래용?"
            case .etc:
                "아직 준비 중"
        }
    }
}

extension Tamagochi {
    static var list: [Tamagochi] = [
        Tamagochi(type: .green, name: "따끔따끔 다마고치"),
        Tamagochi(type: .orange, name: "방실방실 다마고치"),
        Tamagochi(type: .red, name: "반짝반짝 다마고치"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요"),
        Tamagochi(type:. etc, name: "준비중이에요")
    ]
}
