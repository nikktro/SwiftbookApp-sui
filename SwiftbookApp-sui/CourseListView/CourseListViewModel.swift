//
//  CourseListViewModel.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 29.01.2023.
//

import Foundation

protocol CourseListViewModelProtocol {
    var rows: [CourseDetailsViewModel] { get }
    func fetchCourses() async
}

class CourseListViewModel: CourseListViewModelProtocol, ObservableObject {
    @Published var rows: [CourseDetailsViewModel] = []
    
    func fetchCourses() async {
        do {
            let courses = try await NetworkManager.shared.fetchCourses()
            courses.forEach { course in
                let courseDetailsViewModel = CourseDetailsViewModel(course: course)
                rows.append(courseDetailsViewModel)
            }
        } catch {
            print(error)
        }
    }
    
}
