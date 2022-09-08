//
//  FavoritesView.swift
//  CalorieCounter
//
//  Created by Marin on 08.09.2022..
//

import SwiftUI

struct FavoritesView: View {

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Favorites")
                        .padding(.horizontal)

                    Spacer()
                }

                ForEach(0...15, id: \.self) { _ in
                    FavoriteView()
                }
            }
            .padding()
        }
        .background(Color.init("BackgroundColor").ignoresSafeArea(.all, edges: .top))
    }

}

struct FavoriteView: View {

    var body: some View {
        VStack {
            HStack {
                Text("Chocolate")

                Text("0.0 kcal")

                Spacer()

                Text("<3")
            }

            HStack {
                Text("100g")

                Spacer()

                Text("+")
            }
        }
        .padding()
        .background(Color.init("ElementColor"))
        .cornerRadius(10)
    }

}

struct FavoritesView_Previews: PreviewProvider {

    static var previews: some View {
        FavoritesView()
    }

}
