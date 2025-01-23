//
//  StaticsData.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/23/25.
//

import Foundation

// MARK: - StaticsData
struct StaticsData: Decodable {
    let id, slug: String
    let downloads, views, likes: Downloads
}

// MARK: - Downloads
struct Downloads: Decodable {
    let total: Int
    let historical: Historical
}

// MARK: - Historical
struct Historical: Decodable {
    let change: Int
    let resolution: String
    let quantity: Int
    let values: [Value]
}

// MARK: - Value
struct Value: Decodable {
    let date: String
    let value: Int
}
