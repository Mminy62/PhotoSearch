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
    private var starButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .gray
        config.baseForegroundColor = .systemYellow
        config.image = UIImage(systemName: "star.fill")
        config.image?.withTintColor(.systemYellow)
        config.cornerStyle = .capsule
        let button = UIButton()
        button.configuration = config
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(starButton)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
   
        starButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        starButton.setTitleColor(.white, for: .normal)
    }
    
    func configureData(item: Result) {
        imageView.kf.setImage (
            with: URL(string: item.urls.thumb)
        )
        
        starButton.setTitle(String(item.likes), for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
