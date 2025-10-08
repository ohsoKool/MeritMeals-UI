import SwiftUI

struct RestaurantMenu: View {
    var categories: [String] = ["Starters", "Meals", "Combos", "Deserts", "Drinks"]
    var restaurantName: String
    var restaurantLocation: String
    var restaurantRating: String
    var dishNames: [String] = ["Chicken 65", "Burger", "Pizza", "Pasta", "Tacos", "FrenchFries"]
    var dishPrices: [Int] = [100, 90, 180, 230, 120, 60]
    var filters: [String] = ["Veg", "Non Veg", "Healthy", "Egg", "Recommended"]
    var dishImages: [String] = ["chicken65", "burger2", "pizza", "pasta", "tacos", "frenchfries"]

    var showRestaurant = true

    // Build dishes from parallel arrays
    var menuItems: [MenuItem] {
        zip(zip(dishNames, dishPrices), dishImages).map { pair, img in
            let (name, price) = pair
            return MenuItem(
                id: UUID(),
                MenuCategoryId: UUID(),
                name: name,
                price: String(price), // Made this Integer as String
                description: "Secret recipe filled with Joy!",
                image: img,
            )
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                LinearGradientView()
                VStack {
                    RestaurantHeader(
                        restaurantName: restaurantName,
                        restaurantLocation: restaurantLocation,
                        restaurantRating: restaurantRating
                    )

                    FilterCategoriesView(filters: filters)

                    MenuItemList(
                        menuItems: menuItems,
                        showRestaurant: showRestaurant
                    )
                    .cornerRadius(24)
                }
            }
        }
    }
}

#Preview {
    RestaurantMenu(
        restaurantName: "The Shawarma Wrapz",
        restaurantLocation: "O.U.Colony",
        restaurantRating: "4.5 ⭐",
    )
}
