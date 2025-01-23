//
//  Enum+API.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/23/25.
//

import Foundation

struct SearchQueryParams {
    let item: String
    let page: Int
    let order: SearchSort
}

struct StaticsQueryParams {
    let imageID: String
}

enum API {
    static let defaultURL = "https://api.unsplash.com/"
    case search
    case statics
    
    var url: String {
        switch self {
            
        case .search:
            return API.defaultURL + "/search/photos?"
        case .statics:
            return API.defaultURL + "/photos/"
        }
    }
    
    // 쿼리 파라미터 반환
    func queryParams<T>(from params: T) -> String {
        switch self {
        case .search:
            guard let searchParams = params as? SearchQueryParams else { return "" }
            return "query=\(searchParams.item)&page=\(String(searchParams.page))&per_page=20&order_by=\(searchParams.order)&client_id=\(APIKey.search.value)"
        case .statics:
            guard let staticsParams = params as? StaticsQueryParams else { return "" }
            return "\(staticsParams.imageID)/statistics?client_id=\(APIKey.search.value)"
        }
    }
}
