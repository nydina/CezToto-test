//
//  InfosView.swift
//  ChezToto
//
//  Created by Amandine Cousin on 14/11/2023.
//

import SwiftUI

struct InfosView: View {
    var body: some View {
        VStack(alignment: .leading) {
            TimeView(day: "Lundi", hours: "Fermé")
            TimeView(day: "Mardi", hours: "11h30 - 14h30・ 18h30 - 22h00")
            TimeView(day: "Mercredi", hours: "11h30 - 14h30・ 18h30 - 22h00")
            TimeView(day: "Jeudi", hours: "11h30 - 14h30・ 18h30 - 22h00")
            TimeView(day: "Vendredi", hours: "11h30 - 14h30・ 18h30 - 22h00")
            TimeView(day: "Samedi", hours: "11h30 - 14h30・ 18h30 - 22h00")
            TimeView(day: "Dimanche", hours: "Fermé")
                .padding(.bottom, 30)
            InfoDetailsView(type: "location", text: "12  Rue Tolbiac - 75010 Paris")
            InfoDetailsView(type: "web", text: "www.cheztotopizza.fr")
            InfoDetailsView(type: "phone", text: "06 12 34 56 78")
        }
    }
}

struct TimeView: View {
    let day: String
    let hours: String
    
    var body: some View {
        HStack {
            Image("clock")
            Text(day)
                .foregroundStyle(.customGray)
                .fontWeight(.semibold)
                .font(.system(size: 13))
            Spacer()
            Text(hours)
                .foregroundStyle(.customGray)
                .font(.system(size: 13))
        }
    }
}

struct InfoDetailsView: View {
    let type: String
    let text: String
    
    var body: some View {
        HStack {
            Image(type)
            Text(text)
                .foregroundStyle(.customGray)
                .font(.system(size: 13))
        }
    }
}

#Preview {
    InfosView()
}
