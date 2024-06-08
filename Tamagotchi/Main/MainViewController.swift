//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit
import SnapKit
import Toast

enum ButtonImageType: String {
    case food = "drop.circle"
    case water = "leaf.circle"
}

class MainViewController: UIViewController, setupView {
    
    var tamagochi: Tamagochi? = Tamagochi.list.first {
        didSet {
            updateTamagochi()
        }
    }
    let messages = Message.list
    
    lazy var naviBorder: UIView = makeBorder(alpha: 0.2)
    
    lazy var bubbleImageView = UIImageView()
    
    lazy var bubbleLabel: UILabel = {
        let label = UILabel()
        label.configureDescLabel(15, .bold)
        return label
    }()
    
    lazy var tamagochiImageView = UIImageView()
    
    lazy var tamagochiNameLabel: UILabel = {
        let label = UILabel()
        label.configureNameLabel(15, .bold)
        return label
    }()
    
    lazy var tamagochiStatusLabel: UILabel = {
        let label = UILabel()
        label.configureDescLabel(13, .bold)
        return label
    }()
    
    lazy var foodTextField: UITextField = makeTextField(placeholder: "밥주세용")
    
    lazy var foodTextFieldBorder = makeBorder()
    
    lazy var foodBtn: UIButton = makeButton("밥먹기", type: .food)
    
    lazy var waterTextField: UITextField = makeTextField(placeholder: "물주세용")
    
    lazy var waterFieldBorder = makeBorder()
    
    lazy var waterBtn = makeButton("물먹기", type: .water)
    
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupUI()
        updateTamagochi()
    }
    
    
    func setupHierarchy() {
        view.addSubview(naviBorder)
        view.addSubview(bubbleImageView)
        view.addSubview(bubbleLabel)
        view.addSubview(tamagochiImageView)
        view.addSubview(tamagochiNameLabel)
        view.addSubview(tamagochiStatusLabel)
        view.addSubview(foodTextField)
        view.addSubview(foodTextFieldBorder)
        view.addSubview(foodBtn)
        view.addSubview(waterTextField)
        view.addSubview(waterFieldBorder)
        view.addSubview(waterBtn)
    }
    
    func setupConstraints() {
        naviBorder.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(0.5)
        }
        
        bubbleImageView.snp.makeConstraints {
            $0.bottom.equalTo(tamagochiImageView.snp.top).offset(-6)
            $0.width.equalTo(250)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        bubbleLabel.snp.makeConstraints {
            $0.top.equalTo(bubbleImageView.snp.top).offset(8)
            $0.horizontalEdges.bottom.equalTo(bubbleImageView).inset(20)
            $0.centerX.equalTo(bubbleImageView.snp.centerX)
        }
        
        tamagochiImageView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.centerY.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        tamagochiNameLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(tamagochiImageView.snp.width).multipliedBy(0.6)
            $0.centerX.equalTo(tamagochiImageView.snp.centerX)
            $0.top.equalTo(tamagochiImageView.snp.bottom).offset(8)
        }
        
        tamagochiStatusLabel.snp.makeConstraints {
            $0.top.equalTo(tamagochiNameLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalTo(tamagochiImageView)
        }
        
        foodTextField.snp.makeConstraints {
            $0.width.equalTo(view.snp.width).multipliedBy(0.35)
            $0.leading.equalTo(tamagochiImageView.snp.leading).offset(-8)
            $0.top.equalTo(tamagochiStatusLabel.snp.bottom).offset(32)
        }
        
        foodTextFieldBorder.snp.makeConstraints {
            $0.top.equalTo(foodTextField.snp.bottom).offset(4)
            $0.horizontalEdges.equalTo(foodTextField)
            $0.height.equalTo(1)
        }
        
        foodBtn.snp.makeConstraints {
            $0.centerY.equalTo(foodTextField.snp.centerY).offset(-2)
            $0.leading.equalTo(foodTextField.snp.trailing).offset(8)
            $0.height.equalTo(30)
        }
        
        waterTextField.snp.makeConstraints {
            $0.top.equalTo(foodTextFieldBorder.snp.bottom).offset(24)
            $0.leading.width.equalTo(foodTextField)
        }
        
        waterFieldBorder.snp.makeConstraints {
            $0.top.equalTo(waterTextField.snp.bottom).offset(4)
            $0.horizontalEdges.equalTo(waterTextField)
            $0.height.equalTo(1)
        }
        
        waterBtn.snp.makeConstraints {
            $0.centerY.equalTo(waterTextField.snp.centerY).offset(-2)
            $0.leading.equalTo(waterTextField.snp.trailing).offset(8)
            $0.height.equalTo(30)
        }
    }
    
    func setupUI() {
        view.backgroundColor = Color.backgroundColor
        navigationItem.title = "\(User.name)님의 다마고치"
        let settingItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = settingItem
        navigationController?.navigationBar.tintColor = Color.fontAndBorderColor
    }
    
    func updateTamagochi() {
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleLabel.text = messages.randomElement()?.message
        guard let image = tamagochi?.imageName else { return }
        tamagochiImageView.image = UIImage(named: image)
        tamagochiNameLabel.text = tamagochi?.name
        tamagochiStatusLabel.text = tamagochi?.status
    }
}
