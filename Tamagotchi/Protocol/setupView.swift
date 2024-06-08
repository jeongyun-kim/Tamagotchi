//
//  setupView.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit

@objc protocol setupView {
    func setupHierarchy()
    func setupConstraints()
    @objc optional func setupTableView()
    @objc optional func setupUI()
}


