//
//  UIImageView + Extension.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit

extension UIImageView {
    func configureImageView() {
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 45
    }
}
