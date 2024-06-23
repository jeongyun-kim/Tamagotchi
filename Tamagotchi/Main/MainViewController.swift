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
    
    lazy var ud = UserDefaultsManager()
    
    // 사용자가 현재 선택한 다마고치 받아오기
    lazy var tamagotchi: Tamagotchi? = nil

    lazy var foodCnt = ud.food { // 밥양 가져오기
        didSet {
            saveData()
            updateTamagotchi()
        }
    }
    
    lazy var waterCnt = ud.water { // 물양 가져오기 
        didSet {
            saveData()
            updateTamagotchi()
        }
    }
    
    // 다마고치가 말하는 내용들
    lazy var messages: [Message] = Message.list
    
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
    
    lazy var foodTextField: UITextField = makeTextField(placeholder: Placeholder.foodTextField.rawValue, isMainView: true)
    
    lazy var foodTextFieldBorder = makeBorder()
    
    lazy var foodBtn: UIButton = makeButton(ButtonTitle.foodBtnTitle.rawValue, type: .food)
    
    lazy var waterTextField: UITextField = makeTextField(placeholder: Placeholder.waterTextField.rawValue, isMainView: true)
    
    lazy var waterFieldBorder = makeBorder()
    
    lazy var waterBtn = makeButton(ButtonTitle.waterBtnTitle.rawValue, type: .water)
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupUI()
        addTargets()
    }
    
    // 다마고치 / 사용자명 변경되면 변경된 데이터 다시 보여주기 위해 viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messages = Message.list // 데이터 갱신 시마다 초기화
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
        let settingItem = UIBarButtonItem(image: UIImage(systemName: ButtonImageType.setting.rawValue), style: .plain, target: self, action: #selector(settingBtnTapped))
        navigationItem.rightBarButtonItem = settingItem
        navigationController?.navigationBar.tintColor = .customTintColor
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.backButtonTitle = ""
    }
    
    func setupUI() {
        view.backgroundColor = .customBackgroundColor
        //foodTextField.delegate = self
        //waterTextField.delegate = self
    }
    
    func addTargets() {
        foodBtn.addTarget(self, action: #selector(foodBtnTapped), for: .touchUpInside)
        waterBtn.addTarget(self, action: #selector(waterBtnTapped), for: .touchUpInside)
    }
    
    func updateTamagotchi() {
        bubbleImageView.image = UIImage(named: ImageView.bubble.rawValue)
        bubbleLabel.text = messages.randomElement()?.message
        guard let image = tamagotchi?.imageName else { return }
        tamagochiImageView.image = UIImage(named: image)
        tamagochiNameLabel.text = tamagotchi?.name
        tamagochiStatusLabel.text = tamagotchi?.status
    }
    
    func saveData() {
        ud.food = foodCnt // UserDefaults에 현재 food값 저장
        ud.water = waterCnt // UserDefault에 현재 water값 저장
    }
    
    // MARK: Action
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func getFoodCount(food: String) throws -> Int {
        guard !food.isEmpty else {
            return 1
        }
        guard Int(food)! < 100 else {
            throw ErrorCase.isFoodOver
        }
        return Int(food)!
    }
    
    @objc func foodBtnTapped(_ sender: UIButton) {
        guard let food = foodTextField.text else { return }
        do {
            let food = try getFoodCount(food: food)
            foodCnt += food
        } catch {
            switch error {
            case ErrorCase.isFoodOver:
                showToast(message: ErrorCase.isFoodOver.toastMessage)
            default:
                break
            }
        }
        foodTextField.text = ""
    }
    
    private func getWaterCount(water: String) throws -> Int {
        guard !water.isEmpty else {
            return 1
        }
        guard Int(water)! < 50 else {
            throw ErrorCase.isWaterOver
        }
        return Int(water)!
    }
    
    @objc func waterBtnTapped(_ sender: UIButton) {
        guard let water = waterTextField.text else { return }
        do {
            let waterCount = try getWaterCount(water: water)
            waterCnt += waterCount
        }
        catch {
            switch error {
            case ErrorCase.isWaterOver:
                showToast(message: ErrorCase.isWaterOver.rawValue)
            default:
                break
            }
        }
        waterTextField.text = ""
    }
    
    @objc func settingBtnTapped(_ sender: UIButton) {
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

