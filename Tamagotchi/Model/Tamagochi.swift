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
    let food: Double = 0
    let water: Double = 0
    
    var level: Int {
        let expToLevel = Int((food/5 + water/2)/10)
        
        if expToLevel == 0 {
            return 1
        } else if expToLevel >= 10 {
            return 10
        } else {
            return expToLevel
        }
    }
    
    var imageName: String {
        switch type {
            case .green, .orange, .red:
                switch level {
                    case 0..<2: return "\(type.rawValue)-1"
                    case 2..<3: return "\(type.rawValue)-2"
                    case 3..<4: return "\(type.rawValue)-3"
                    case 4..<5: return "\(type.rawValue)-4"
                    case 5..<6: return "\(type.rawValue)-5"
                    case 6..<7: return "\(type.rawValue)-6"
                    case 7..<8: return "\(type.rawValue)-7"
                    case 8..<9: return "\(type.rawValue)-8"
                    case 9...: return "\(type.rawValue)-9"
                    default: return "noImage"
                }
            case .etc:
                return "noImage"
            }
    }
    
    var desc: String {
        switch type {
            case .green, .orange, .red:
                "저는 \(name)에용✨\n저는 노는게 제일 좋아용 \(User.name)도 그렇죵?"
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
        Tamagochi(type:. etc, name: "준비중이에요"),
    ]
}
