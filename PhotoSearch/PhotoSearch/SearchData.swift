//
//  SearchData.swift
//  PhotoSearch
//
//  Created by 이민영 on 1/19/25.
//
import Foundation

// MARK: - SearchData
struct SearchData: Decodable {
    let total: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let id: String
    let created_at: String // String?
    let width, height: Int
    let urls: Urls
    let likes: Int
    let user: User
}

// MARK: - Urls
struct Urls: Decodable {
    let raw: String
    let small: String
}

// MARK: - User
struct User: Decodable {
    let name: String
    let profile_image: ProfileImage
}

// MARK: - ProfileImage
struct ProfileImage: Decodable {
    let medium: String
}
