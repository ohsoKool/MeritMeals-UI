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

                Text("₹\(menuItem.price)")
                    .foregroundColor(.black.opacity(0.7))
                    .fontWeight(.bold)

                Text(menuItem.description)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(menuItem.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(8)
//                .overlay(
//                    Button(action: {
//                        cart.addItem(dish: dish.name)
//                        // print("\(dish) added to cart!")
//                    }) {
//                        Text("ADD")
//                            .font(.caption)
//                            .fontWeight(.bold)
//                            .padding(6)
//                            .background(Color.black.opacity(0.7))
//                            .cornerRadius(16)
//                            .foregroundColor(.white)
//                    }
//                    .padding(6),
//                    alignment: .bottomTrailing
//                )
        }
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
