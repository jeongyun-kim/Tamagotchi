//
//  TamagochiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 김정윤 on 6/8/24.
//

import UIKit
import SnapKit

class TamagochiCollectionViewCell: UICollectionViewCell, setupView {
    let view = UIView()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.configureImageView()
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.configureNameLabel()
        return label
    }()
    
    // collectionViewCell은 frame으로 init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
        self.backgroundColor = Color.backgroundColer
    }
    
    func setupHierarchy() {
        contentView.addSubview(view)
        view.addSubview(imageView)
        view.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        view.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(16).priority(.high)
        }
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(110)
            $0.top.equalTo(view.snp.top)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        nameLabel.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(imageView.snp.width)
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func configureCell(_ data: Tamagochi) {
        imageView.image = UIImage(named: data.imageName)
        nameLabel.text = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
