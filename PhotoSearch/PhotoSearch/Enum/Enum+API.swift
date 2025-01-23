//
//  Enum+API.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/23/25.
//

import Foundation

enum API {
    case search

    var url: String {
        switch self {
            
        case .search:
            return "https://api.unsplash.com/search/photos?"
        }
        
    }
}
