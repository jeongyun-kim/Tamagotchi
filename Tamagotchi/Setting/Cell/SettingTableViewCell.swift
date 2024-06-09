//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/9/24.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell{

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    func configureLayout() {
        self.backgroundColor = .clear
        self.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        self.detailTextLabel?.textColor = .customTintColor
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
        self.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        self.tintColor = .customTintColor
    }
    
    func configureCell(_ data: Setting) {
        self.detailTextLabel?.text = data.desc
        self.textLabel?.text = data.title
        self.imageView?.image = UIImage(systemName: data.leftIcon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
