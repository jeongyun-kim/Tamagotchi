//
//  UILabel + Extension.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit

extension UILabel {
    func configureNameLabel() {
        self.font = UIFont.systemFont(ofSize: 13)
        self.textColor = Color.fontAndBorderColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = Color.fontAndBorderColor.cgColor
        self.backgroundColor = .clear
        self.textAlignment = .center
    }
}
