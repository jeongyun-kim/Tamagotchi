//
//  PopupViewController.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit
import SnapKit


class PopupViewController: UIViewController, setupView {
    
    lazy var tamagotchi: Tamagotchi? = nil
    
    lazy var popupViewType: PopupViewType = .select
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customBackgroundColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .customBackgroundColor
        imageView.image = UIImage(named: tamagotchi!.mainImageName)
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.configureNameLabel(14, .bold)
        label.text = tamagotchi!.name
        return label
    }()
    
    lazy var border: UIView = makeBorder()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = tamagotchi!.desc
        label.configureDescLabel(13)
        return label
    }()
    
    lazy var cancelBtn: UIButton = {
        let button = UIButton()
        button.configurePopupButtons(ButtonTitle.cancel.rawValue, cornerRadiusAt: .layerMinXMaxYCorner)
        button.backgroundColor = .customTintColor.withAlphaComponent(0.2)
        button.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var selectBtn: UIButton = {
        let button = UIButton()
        button.configurePopupButtons(popupViewType.rawValue, cornerRadiusAt: .layerMaxXMaxYCorner)
        button.addTarget(self, action: #selector(selectBtnTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var stackViewBorder: UIView = makeBorder(alpha: 0.2)
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 8
        return stackView
    }()
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray.withAlphaComponent(0.5)
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        view.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(border)
        containerView.addSubview(descLabel)
        containerView.addSubview(stackViewBorder)
        containerView.addSubview(horizontalStackView)
        [cancelBtn, selectBtn].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.width.equalTo(view.snp.width).multipliedBy(0.8)
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
            $0.center.equalTo(view.snp.center)
        }
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(containerView.snp.width).multipliedBy(0.4)
            $0.top.equalTo(containerView.snp.top).offset(30)
            $0.centerX.equalTo(containerView.snp.centerX)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.equalTo(imageView.snp.centerX)
            $0.width.equalTo(imageView.snp.width).inset(2)
            $0.height.equalTo(30)
            $0.top.equalTo(imageView.snp.bottom).offset(8)
        }
        
        border.snp.makeConstraints {
            $0.width.equalTo(containerView.snp.width).multipliedBy(0.8)
            $0.centerX.equalTo(containerView.snp.centerX)
            $0.top.equalTo(nameLabel.snp.bottom).offset(30)
            $0.height.equalTo(1)
        }
        
        descLabel.snp.makeConstraints {
            $0.width.equalTo(border.snp.width)
            $0.centerX.equalTo(border.snp.centerX)
            $0.top.equalTo(border.snp.bottom).offset(24)
        }
        
        stackViewBorder.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.top.greaterThanOrEqualTo(descLabel.snp.bottom).offset(24)
            $0.horizontalEdges.equalTo(containerView)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.top.equalTo(stackViewBorder.snp.bottom)
            $0.height.equalTo(containerView.snp.height).multipliedBy(0.12)
            $0.horizontalEdges.bottom.equalTo(containerView)
        }
    }
    
    // MARK: Actions
    @objc func cancelBtnTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func selectBtnTapped(_ sender: UIButton) {
        let vc = MainViewController()
        vc.tamagotchi = tamagotchi // 사용자가 선택한 다마고치 세팅
        
        let shared = UserDefaultsManager.shared
        shared.userName = User.name // UserDefaults에 현재 사용자명 저장
        shared.selectedTamagotchiRawValue = tamagotchi!.type.rawValue // UserDefaults에 현재 사용자가 선택한 다마고치의 rawValue(1부터) 저장
    
        navigationController?.pushViewController(vc, animated: false)
    }
}
