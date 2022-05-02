//
//  DataModel.swift
//  MP1-MVC Basic App
//
//  Created by Arslan Kaan AYDIN on 1.05.2022.
//

import Foundation

// MARK: - DataModel
struct DataModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
}
