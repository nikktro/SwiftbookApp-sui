//
//  CourseListView.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 29.01.2023.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.courseName) { courseDetailsViewModel in
                NavigationLink(destination: CourseDetailsView(viewModel: courseDetailsViewModel)) {
                    RowView(viewModel: courseDetailsViewModel)
                }
            }
            .navigationTitle("Courses")
        }
        .onAppear {
            Task {
                await viewModel.fetchCourses()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
