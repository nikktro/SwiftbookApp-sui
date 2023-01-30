//
//  FavoriteStatusButton.swift
//  SwiftbookApp-sui
//
//  Created by Nikolay Trofimov on 30.01.2023.
//

import SwiftUI

struct FavoriteStatusButton: View {
    let isFavorite: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? .red : .gray)
        }
        .offset(x: 115, y: 60)
    }
    
}

struct FavoriteStatusButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteStatusButton(isFavorite: true) {
            print("Button Pressed!")
        }
    }
}
