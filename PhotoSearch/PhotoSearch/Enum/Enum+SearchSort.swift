//
//  Enum+Search.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/22/25.
//

import Foundation

enum SearchSort: Int {
    case accurate = 0
    case latest
    
    var title: String {
        switch self {
        
        case .accurate:
            " 관련순 "
        case .latest:
            " 최신순 "
        }
    }
    
    var query: String {
        switch self {
            
        case .accurate:
            "default"
        case .latest:
            "latest"
        }
    }
}
