//
//  CourseListView.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 29.01.2023.
//

import SwiftUI

struct CourseListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
            .navigationTitle("Courses")
            .navigationBarItems(trailing: Button("Fetch Data") { })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
