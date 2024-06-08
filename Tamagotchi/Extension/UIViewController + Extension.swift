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
        view.backgroundColor = Color.fontAndBorderColor.withAlphaComponent(alpha)
        return view
    }
    
    func makeTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.textColor = Color.fontAndBorderColor
        textField.keyboardType = .numberPad
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
        
        button.tintColor = Color.fontAndBorderColor
    
        button.setImage(UIImage(systemName: type.rawValue), for: .normal)
        
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(Color.fontAndBorderColor, for: .normal)
        button.titleLabel?.configureDescLabel(13, .bold)
        
        button.layer.borderColor = Color.fontAndBorderColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        
        return button
    }
    
    func showToast(message: String) {
        var toastStyle = ToastStyle()
        toastStyle.backgroundColor = Color.fontAndBorderColor
        toastStyle.messageColor = .white
        self.view.makeToast(message, position: .center, style: toastStyle)
    }
}
