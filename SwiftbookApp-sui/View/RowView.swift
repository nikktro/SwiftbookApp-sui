//
//  RowView.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 30.01.2023.
//

import SwiftUI

struct RowView: View {
    let viewModel: CourseDetailsViewModel
    
    var body: some View {
        HStack {
            CourseImage(
                imageData: viewModel.imageData,
                imageSize: CGSize(width: 130, height: 100),
                cornerRadius: 10,
                shadowIsOn: false
                
            )
            Text(viewModel.courseName)
            Spacer()
        }
    }
    
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(viewModel: CourseDetailsViewModel(course: Course.getCourse()))
    }
}
