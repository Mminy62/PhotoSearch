//
//  NetworkManager.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/20/25.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }

    func callSearchAPI(_ searchItem: String, _ page: Int, _ sortType: SearchSort, completionHandler: @escaping (SearchData) -> ()) {
        let url = "https://api.unsplash.com/search/photos?query=\(searchItem)&page=\(page)&per_page=20&order_by=\(sortType.query)&client_id=\(APIKey.search.value)"
        
        AF.request(url, method: .get)
            .responseDecodable(of: SearchData.self) { response in
                switch response.result {
                    
                case .success(let value):
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
