//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/9/24.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController, setupView {
    
    lazy var list = SettingList.settingList {
        didSet {
            tableView.reloadData()
        }
    }

    lazy var naviBorder: UIView = makeBorder(alpha: 0.2)
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupTableView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        list = SettingList.settingList // 닉네임 변경된 데이터 새로 넣어주기위해 
    }
    
    func setupHierarchy() {
        view.addSubview(naviBorder)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        naviBorder.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(0.5)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(naviBorder.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupTableView() {
        tableView.backgroundColor = .customBackgroundColor
        tableView.separatorColor = .customTintColor.withAlphaComponent(0.2)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    
    func setupUI() {
        view.backgroundColor = .customBackgroundColor
        navigationItem.title = "설정"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.customTintColor]
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        cell.configureCell(list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(UserNameChangeViewController(), animated: true)
        case 1: print("1")
        case 2: print("2")
        default: break
        }
    }
}
