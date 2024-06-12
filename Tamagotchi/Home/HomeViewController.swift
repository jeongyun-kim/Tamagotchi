//
//  HomeViewController.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit
import SnapKit



class HomeViewController: UIViewController, setupView {
    
    var list: [Tamagotchi] = Tamagotchi.list
    
    var viewType: MainViewType = .select // 기본은 선택하기 / 변경할 때에는 타입 변경해주기
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupCollectionView()
        setupUI()
    }
    
    func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(TamagochiCollectionViewCell.self, forCellWithReuseIdentifier: TamagochiCollectionViewCell.identifier)
    
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    func setupUI() {
        view.backgroundColor = .customBackgroundColor
        collectionView.backgroundColor = .customBackgroundColor
        navigationItem.title = "\(viewType.rawValue)"
        // 그냥 안 보이게하면 변경하기로 왔을 때에도 사라지기 때문에 if문으로 처리
        if viewType == .select { navigationItem.hidesBackButton = true }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagochiCollectionViewCell.identifier, for: indexPath) as! TamagochiCollectionViewCell
        cell.configureCell(list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PopupViewController()
        vc.tamagotchi = list[indexPath.row]
        
        // 현재 뷰가 선택하기라면 팝업뷰도 선택하기 / 현재 뷰가 변경하기라면 팝업뷰도 변경하기
        let popupViewType: PopupViewType = viewType == .select ? .select : .change
        vc.popupViewType = popupViewType
        
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .overCurrentContext
        present(navi, animated: true)
    }
}
