//
//  UIViewController + Extension.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit
import Toast

extension UIViewController {
    func makeBorder(alpha: CGFloat = 1) -> UIView {
        let view = UIView()
        view.backgroundColor = .customTintColor.withAlphaComponent(alpha)
        return view
    }
    
    func makeTextField(placeholder: String, isMainView: Bool) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.placeholder = placeholder
        textField.borderStyle = .none
        textField.textColor = .customTintColor
        if isMainView {
            textField.textAlignment = .center
            textField.keyboardType = .numberPad
        }
        return textField
    }
    
    func makeButton(_ title: String, type: ButtonImageType) -> UIButton {
        let button = UIButton()
        
        var config = UIButton.Configuration.plain()
        let pointSize: CGFloat = 12
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize)
        config.preferredSymbolConfigurationForImage = imageConfig
        config.imagePadding = 2
        button.configuration = config
        
        button.tintColor = .customTintColor
    
        button.setImage(UIImage(systemName: type.rawValue), for: .normal)
        
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(.customTintColor, for: .normal)
        button.titleLabel?.configureDescLabel(13, .bold)
        
        button.layer.borderColor = UIColor.customTintColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        
        return button
    }
    
    // MARK: Show
    func showToast(message: String) {
        var toastStyle = ToastStyle()
        toastStyle.backgroundColor = .customTintColor
        toastStyle.messageColor = .white
        self.view.makeToast(message, position: .center, style: toastStyle)
    }
}
