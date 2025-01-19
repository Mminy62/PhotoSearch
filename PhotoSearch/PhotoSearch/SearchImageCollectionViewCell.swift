//
//  SearchImageCollectionViewCell.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/19/25.
//

import UIKit
import SnapKit
import Kingfisher

class SearchImageCollectionViewCell: UICollectionViewCell {
    static let id = "SearchImageCollectionViewCell"
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    
    }
    
    func configureData(item: Result) {
        imageView.kf.setImage (
            with: URL(string: item.urls.raw)
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
