//
//  CourseDetailsView.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 30.01.2023.
//

import SwiftUI

struct CourseDetailsView: View {
    @StateObject var viewModel: CourseDetailsViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.courseName)
                .font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    CourseImage(
                        imageData: viewModel.imageData,
                        imageSize: CGSize(width: 230, height: 180),
                        cornerRadius: 30,
                        shadowIsOn: true
                    )
                    FavoriteStatusButton(isFavorite: viewModel.isFavorite) {
                        viewModel.favoriteButtonPressed()
                    }
                }
                
                Text(viewModel.numberOfLessons)
                    .font(.headline)
                Text(viewModel.numberOfTests)
                    .font(.headline)
            }
            Spacer()
        }
    }
    
}

struct CourseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsView(viewModel: CourseDetailsViewModel(course: Course.getCourse()))
    }
}
