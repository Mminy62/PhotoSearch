//
//  Extension+String.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/23/25.
//

import Foundation

extension String {
    func queryAdd(searchItem: String, page: String, order: SearchSort) -> String {
        return self + "query=\(searchItem)&page=\(page)&per_page=20&order_by=\(order.query)&client_id=\(APIKey.search.value)"
    }
}
