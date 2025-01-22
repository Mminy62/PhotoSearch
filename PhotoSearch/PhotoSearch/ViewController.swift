//
//  ViewController.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/18/25.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class ViewController: BaseViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    let sortButton = UIButton()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
    var dataList: [Result] = []
    var page: Int = 1
    var isEnd: Bool = false
    var isRecent: Bool = false
    var searchItem: String? = nil
    var sortType: SearchSort = .accurate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchImageCollectionViewCell.self, forCellWithReuseIdentifier: SearchImageCollectionViewCell.id)
        collectionView.register(EmptyCollectionViewCell.self, forCellWithReuseIdentifier: EmptyCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        searchBar.delegate = self
        navigationItem.title = "SEARCH PHOTO"
    }
    
    override func configureHierachy() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        view.addSubview(sortButton)
    }
    
    override func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        sortButton.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(sortButton.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        view.backgroundColor = .white
        searchBar.placeholder = "키워드 검색"
        searchBar.searchBarStyle = .minimal
        sortButton.setTitle(sortType.title, for: .normal)
        sortButton.setTitleColor(.black, for: .normal)
        sortButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        sortButton.layer.borderWidth = 1
        sortButton.layer.borderColor = UIColor.black.cgColor
        sortButton.layer.cornerRadius = 10
        sortButton.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
    }
    
    @objc func sortButtonTapped(_ sender: UIButton) {
        dataList.removeAll()
        callRequest()
        isRecent.toggle()
        sortType = isRecent ? .latest : .accurate
        sortButton.setTitle(sortType.title, for: .normal)
        collectionView.scrollsToTop = true
    }
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        let cellSpcing = 5.0
        if searchItem == nil {
            layout.itemSize = CGSize(width: screenWidth, height: screenHeight / 2 )
        } else {
            layout.itemSize = CGSize(width: (screenWidth / 2) - (cellSpcing / 2.0 ), height: screenHeight / 3)
        }
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        return layout
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        if text.trimmingCharacters(in: .whitespaces).count != 0 && searchItem != text {
            dataList.removeAll()
            collectionView.scrollsToTop = true
            searchItem = text
            callRequest()
        }
        
        view.endEditing(true)
    }
    
    func callRequest() {
        guard let searchItem else { return }
        NetworkManager.shared.callSearchAPI(searchItem, page, sortType) { value in
            if value.total == 0 { self.dataList.removeAll() }
            if value.total_pages == self.page { self.isEnd = true }
            if self.page == 1 {
                self.dataList.removeAll()
            }
            self.dataList.append(contentsOf: value.results)
            self.collectionView.collectionViewLayout = self.createCollectionLayout()
            self.collectionView.reloadData()
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataList.isEmpty ? 1 : self.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.dataList.isEmpty {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmptyCollectionViewCell.id, for: indexPath) as! EmptyCollectionViewCell
            cell.configureData(itemFlag: searchItem != nil)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchImageCollectionViewCell.id, for: indexPath) as! SearchImageCollectionViewCell
            let item = self.dataList[indexPath.item]
            cell.configureData(item: item)
            return cell
        }
    }
}


extension ViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for item in indexPaths {
            if !isEnd && item.row == dataList.count - 2 {
                page += 1
                callRequest()
            }
        }
    }
}
