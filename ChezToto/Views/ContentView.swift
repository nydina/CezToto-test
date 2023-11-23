//
//  ContentView.swift
//  ChezToto
//
//  Created by Amandine Cousin on 14/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("chezToto")
                TitleView()
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.accent, lineWidth: 2))
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            }
            InfosView()
                .padding(22)
            Image("plan")
            Spacer()
            NavigationLink {
                MenuView()
            } label : {
                Spacer()
                Text("Accéder au menu")
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            .foregroundColor(.white)
            .background(.accent)
            .clipShape( RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Chez Toto")
                .font(.title)
                .fontWeight(.bold)
            Text("Pizzeria")
                .foregroundStyle(.customGray)
        }
    }
}




#Preview {
    ContentView()
}
