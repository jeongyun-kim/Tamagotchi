//
//  UserNameChangeViewController.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/9/24.
//

import UIKit
import SnapKit
import Toast

class UserNameChangeViewController: UIViewController, setupView {
   
    lazy var ud = UserDefaultsManager()
    
    lazy var naviBorder: UIView = makeBorder(alpha: 0.2)
    
    lazy var userNameTextField = makeTextField(placeholder: Placeholder.nameTextField.rawValue, isMainView: false)

    lazy var textFieldBorder = makeBorder()
    
    let maxLength = 6
    let minimumLength = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupUI()
    }
    
    func setupHierarchy() {
        view.addSubview(naviBorder)
        view.addSubview(userNameTextField)
        view.addSubview(textFieldBorder)
    }
    
    func setupConstraints() {
        naviBorder.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(0.5)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(naviBorder.snp.bottom).offset(16)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.height.equalTo(40)
        }
        
        textFieldBorder.snp.makeConstraints {
            $0.horizontalEdges.equalTo(userNameTextField)
            $0.top.equalTo(userNameTextField.snp.bottom)
            $0.height.equalTo(1.5)
        }
    }
    
    func setupUI() {
        view.backgroundColor = .customBackgroundColor
        navigationItem.title = "대장님 이름 정하기"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customTintColor]
        navigationController?.navigationBar.tintColor = .customTintColor
        
        let saveItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveBtnTapped))
        navigationItem.rightBarButtonItem = saveItem
        
        userNameTextField.becomeFirstResponder()
        userNameTextField.delegate = self
        userNameTextField.text = ud.userName
    }
    
    @objc func saveBtnTapped() {
        guard let text = userNameTextField.text else { return }
        // 공백제거하고 남은 문자 개수
        let removeWhiteSpaceTextCnt = text.components(separatedBy: " ").joined().count
        // 공백 제거 후 남은 문자가 0개거나 입력한 문자가 2문자 미만일 때
        if removeWhiteSpaceTextCnt == 0 || text.count < minimumLength  {
            showToast(message: ToastMessage.nameToast.rawValue)
        } else  {
            ud.userName = text
            navigationController?.popViewController(animated: true)
        }
    }
    
    // 뷰 터치 시 키보드 내리기
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension UserNameChangeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let userName = userNameTextField.text else { return false }
        
        // backspace
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b") // backspace는 \b의 문자열을 가짐
                if isBackSpace == -92 { // 이를 UInt32로 변경해주면 -92의 값이 나옴
                    return true // 이를통해, 현재 사용자가 누른 키가 backspace라면 입력가능하게 해줌
                }
        }
        
        return userName.count >= maxLength ? false : true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
