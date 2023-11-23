//
//  MenuView.swift
//  ChezToto
//
//  Created by Amandine Cousin on 14/11/2023.
//

import SwiftUI

struct MenuView: View {
    let viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.menuArray, id: \.name) { dishType in
                Section(header: Text(dishType.name)) {
                    ForEach(dishType.dishs, id: \.name) { dish in
                        RowView(dish: dish)
                    }
                }
            }
        .navigationTitle("Menu")
    }
}

#Preview {
    MenuView()
}
