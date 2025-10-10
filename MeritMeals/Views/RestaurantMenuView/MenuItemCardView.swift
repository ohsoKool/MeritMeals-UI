// DishCard.swift
// UniEatsPage
//
// Created by Rishikesh Gunda on 9/19/25.

import SwiftUI

struct MenuItemCardView: View {
    let menuItem: MenuItem
    var showRestaurant: Bool = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
//                VStack(alignment: showRestaurant ? .leading : .center) {
                // Only allow the Text element to be created if showRestaurant is true
                if showRestaurant {
                    Text(menuItem.restaurantName!)
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                        .fixedSize() // Prevents extra line height
                }
                Text(menuItem.name)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .fontWeight(.heavy)

                HStack {
                    Text("₹\(menuItem.price)")
                        .foregroundColor(.black.opacity(0.7))
                        .fontWeight(.bold)
                }
                Text(menuItem.description)
                    .foregroundColor(.gray)
            }
//            .border(.black)

            Spacer()

            VStack {
                Image(menuItem.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 1)
                    )
                    .shadow(color: .black, radius: 6)
//                    .overlay(alignment: .bottom) {
//                        AddItemView(menuItem: menuItem)
//                    }
            }
        }
//        .shadow(color: .gray.opacity(0.6), radius: 6)
//        .border(.black)
    }
}

#Preview {
    let sampleMenuItem = MenuItem(
        name: "Pasta",
        restaurantName: "Italian Bistro", price: "499",
        description: "Secret Recipe Filled with Joy", image: "pasta"
    )

    MenuItemCardView(
        menuItem: sampleMenuItem
    )
}
