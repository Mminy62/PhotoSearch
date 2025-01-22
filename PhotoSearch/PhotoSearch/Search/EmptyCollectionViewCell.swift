//
//  EmptyCollectionViewCell.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/20/25.
//

import UIKit
import SnapKit

class EmptyCollectionViewCell: UICollectionViewCell {
    static let id = "EmptyCollectionViewCell"
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.size.equalToSuperview()
            
        }
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(itemFlag: Bool) {
        titleLabel.text = itemFlag ? "검색결과가 없어요." : "사진을 검색해보세요."
    }
    
    
}
