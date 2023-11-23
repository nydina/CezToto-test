//
//  RowView.swift
//  ChezToto
//
//  Created by Amandine Cousin on 15/11/2023.
//

import SwiftUI

struct RowView : View {
    let dish: Dish
    
    var body: some View {
        HStack {
            Image(dish.pictureName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 112, height: 86)
                .cornerRadius(10)
                .padding(.leading, -8)
            VStack(alignment: .leading) {
                Text(dish.name)
                    .font(.system(size:14))
                    .fontWeight(.semibold)
                    .padding(.bottom, 4)
                    .foregroundStyle(.customGray)
                Text(dish.description)
                    .font(.system(size:12))
                    .padding(.bottom, 4)
                    .foregroundStyle(.customGray)
                Text(String(format: "%g €", dish.price))
                    .font(.system(size:12))
                    .fontWeight(.semibold)
                    .foregroundStyle(.customGray)
            }
            .padding(.leading)
        }
    }
}

