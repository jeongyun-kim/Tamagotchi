//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit
import SnapKit
import Toast

class MainViewController: UIViewController, setupView {
    
    var ud = UserDefaultsManager()
    
    var tamagotchi = User.selectedTamagotchi

    lazy var foodCnt = ud.food {
        didSet {
            saveData()
            updateTamagotchi()
        }
    }
    
    lazy var waterCnt = ud.water {
        didSet {
            saveData()
            updateTamagotchi()
        }
    }
    
    // 다마고치가 말하는 내용들
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
    
    lazy var foodTextField: UITextField = makeTextField(placeholder: "밥주세용", isMainView: true)
    
    lazy var foodTextFieldBorder = makeBorder()
    
    lazy var foodBtn: UIButton = makeButton("밥먹기", type: .food)
    
    lazy var waterTextField: UITextField = makeTextField(placeholder: "물주세용", isMainView: true)
    
    lazy var waterFieldBorder = makeBorder()
    
    lazy var waterBtn = makeButton("물먹기", type: .water)
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupUI()
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
        updateTamagotchi()
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
    
    
    // MARK: UI
    func setupNavigation() {
        navigationItem.title = "\(User.name)님의 다마고치"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customTintColor]
        let settingItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(settingBtnTapped))
        navigationItem.rightBarButtonItem = settingItem
        navigationController?.navigationBar.tintColor = .customTintColor
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.backButtonTitle = ""
    }
    
    func setupUI() {
        view.backgroundColor = .customBackgroundColor
        foodTextField.delegate = self
        waterTextField.delegate = self
    }
    
    func addTargets() {
        foodBtn.addTarget(self, action: #selector(foodBtnTapped), for: .touchUpInside)
        waterBtn.addTarget(self, action: #selector(waterBtnTapped), for: .touchUpInside)
    }
    
    func updateTamagotchi() {
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleLabel.text = messages.randomElement()?.message
        guard let image = tamagotchi?.imageName else { return }
        tamagochiImageView.image = UIImage(named: image)
        tamagochiNameLabel.text = tamagotchi?.name
        tamagochiStatusLabel.text = tamagotchi?.status
    }
    
    func saveData() {
        Tamagotchi.food = foodCnt // 현재의 food값을 Tamagotchi.food에 넣어주어야 status값을 받아올 수 있음!
        ud.food = foodCnt // UserDefaults에 현재 food값 저장
        Tamagotchi.water = waterCnt
        ud.water = waterCnt // UserDefault에 현재 water값 저장
    }
    
    // MARK: Action
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func foodBtnTapped(_ sender: UIButton) {
        guard let food = foodTextField.text else { return }
        // 아무런 입력이 없을 때
        if food.isEmpty {
            foodCnt += 1
        } else { // 밥을 100개 이상 줬을 때
            if Int(food)! >= 100 {
                showToast(message: "밥은 한 번에 99개까지만 먹을 수 있어용")
            } else { // 밥 100 미만
                foodCnt += Int(food)!
            }
            foodTextField.text = ""
        }
    }
    
    @objc func waterBtnTapped(_ sender: UIButton) {
        guard let water = waterTextField.text else { return }
        // 아무것도 입력하지 않았다면
        if water.isEmpty {
            waterCnt += 1
        } else { // 물 제한 50 이상
            if Int(water)! >= 50 {
                showToast(message: "물은 한 번에 49방울까지만 먹을 수 있어용")
            } else { // 물 50 미만
                waterCnt += Int(water)!
            }
            waterTextField.text = ""
        }
    }
    
    @objc func settingBtnTapped(_ sender: UIButton) {
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: TextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 부드러운 효과를 위해 애니메이션 처리 -> 뷰 250만큼 올리기
       UIView.animate(withDuration: 0.3) {
           let transform = CGAffineTransform(translationX: 0, y: -200)
           self.view.transform = transform
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 뷰 다시 0으로 내리기
        UIView.animate(withDuration: 0.3) {
            let transform = CGAffineTransform(translationX: 0, y: 0)
            self.view.transform = transform
        }
    }
}
