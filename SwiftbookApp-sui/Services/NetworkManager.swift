//
//  NetworkManager.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 29.01.2023.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidUrl
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCourses() async throws -> [Course] {
        guard let url = URL(string: API.courseURL.rawValue) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let courses = try? decoder.decode([Course].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return courses
    }
    
    func fetchImageData(from url: String) throws -> Data {
        guard let imageURL = URL(string: url) else { throw NetworkError.invalidUrl }
        guard let imageData = try? Data(contentsOf: imageURL) else { throw NetworkError.noData }
        return imageData
    }
    
}

enum API: String {
    case courseURL = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
}
