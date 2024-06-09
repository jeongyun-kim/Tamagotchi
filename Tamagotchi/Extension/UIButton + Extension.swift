//
//  UIButton + Extension.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit

extension UIButton {
    func configurePopupButtons(_ title: String, cornerRadiusAt: CACornerMask) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.customTintColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.layer.maskedCorners = cornerRadiusAt
        self.layer.cornerRadius = 8
    }
}
