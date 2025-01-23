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
    
    func callAPI<T: Decodable>(to url: String,
                 successCompletion: @escaping (T) -> ()) {
        
        AF.request(url, method: .get)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                    
                case .success(let value):
                    successCompletion(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
