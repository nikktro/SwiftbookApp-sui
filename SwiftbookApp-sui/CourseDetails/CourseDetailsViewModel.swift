//
//  CourseDetailsViewModel.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 30.01.2023.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    var imageData: Data? { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var isFavorite: Bool { get }
    init(course: Course)
    func favoriteButtonPressed()
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol, ObservableObject {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        try? NetworkManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavoriteStatus(for: course.name, with: isFavorite)
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = DataManager.shared.loadFavoriteStatus(for: course.name)
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }

}
