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
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
    var dataList: [Result] = []
    var page: Int = 1
    var isEnd: Bool = false
    var searchItem: String?
    
    
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SearchImageCollectionViewCell.self, forCellWithReuseIdentifier: SearchImageCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        callRequest()
    }
    
    override func configureHierachy() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
    }
    
    override func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        searchBar.placeholder = "키워드 검색"
        searchBar.searchBarStyle = .minimal
    }
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        let cellSpcing = 5.0
        layout.itemSize = CGSize(width: (screenWidth / 2) - (cellSpcing / 2.0), height: screenHeight / 3)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        return layout
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func callRequest() {
        let url = "https://api.unsplash.com/search/photos?query=flower&page=\(page)&per_page=20&order_by=latest&color=yellow&client_id=\(APIKey.search.value)"
        
        AF.request(url, method: .get)
            .responseDecodable(of: SearchData.self) { response in
                switch response.result {
                    
                case .success(let value):
                    if value.total_pages == self.page { self.isEnd = true }
                    if self.page == 1 {
                        self.dataList.removeAll()
                    }
                    self.dataList.append(contentsOf: value.results)
                    self.collectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchImageCollectionViewCell.id, for: indexPath) as! SearchImageCollectionViewCell
        let item = self.dataList[indexPath.item]
        
        cell.configureData(item: item)
        return cell
        
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
