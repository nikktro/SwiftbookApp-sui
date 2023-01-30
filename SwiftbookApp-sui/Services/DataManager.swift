//
//  DataManager.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 30.01.2023.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func loadFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
    
    private init() {}
    
}
