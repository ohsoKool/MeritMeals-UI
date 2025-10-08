import SwiftUI

struct MenuItemList: View {
    var menuItems: [MenuItem]
    var showRestaurant: Bool = false

    var body: some View {
//        LazyVStack {
        List(menuItems) { item in
            // Need to pass the showRestaurant flag further down the views as props
            MenuItemCardView(menuItem: item, showRestaurant: showRestaurant)
                .listRowBackground(Color.white.opacity(0.1))
        }
        .listStyle(.plain)
        .listRowInsets(EdgeInsets())
        .cornerRadius(24)
//        }
    }
}

#Preview {
    let sampleDishes = [
        MenuItem(
            name: "Chicken 65",
            restaurantName: "Andhra Spice",
            price: "100",
            description: "Crispy & spicy chicken starter",
            image: "chicken65"
        ),
        MenuItem(
            name: "Burger",
            restaurantName: "Burger King",
            price: "90",
            description: "Classic cheeseburger with fries",
            image: "burger2"
        ),
        MenuItem(
            name: "Pizza",
            restaurantName: "Domino's",
            price: "180",
            description: "Farmhouse pizza with fresh veggies",
            image: "pizza"
        ),
        MenuItem(
            name: "Pasta",
            restaurantName: "Italian Bistro",
            price: "230",
            description: "Creamy Alfredo pasta",
            image: "pasta"
        ),
        MenuItem(
            name: "Tacos",
            restaurantName: "Taco Bell",
            price: "120",
            description: "Mexican street-style tacos",
            image: "tacos"
        ),
        MenuItem(
            name: "French Fries",
            restaurantName: "KFC",
            price: "60",
            description: "Golden crispy fries",
            image: "frenchfries"
        )
    ]

    MenuItemList(menuItems: sampleDishes)
}
