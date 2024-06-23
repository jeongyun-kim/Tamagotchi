//
//  ErrorCase.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/23/24.
//

import Foundation

enum ErrorCase: String, Error {
    case isWaterOver = "물은 한 번에 49방울까지만 먹을 수 있어용"
    case isFoodOver = "밥은 한 번에 99개까지만 먹을 수 있어용"
    
    var toastMessage: String {
        return self.rawValue
    }
}
