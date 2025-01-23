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
        let url = API.search.url.queryAdd(searchItem: searchItem, page: String(page), order: sortType)
        
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
