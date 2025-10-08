import SwiftUI

struct FavoritesDishesView: View {
    var favoriteMenuItems: [MenuItem] = [
        MenuItem(
            id: UUID(),
            MenuCategoryId: UUID(),
            name: "Burger",
            restaurantName: "McBurgerz",
            price: "120",
            description: "Juicy grilled burger with cheese & lettuce",
            image: "burger2"
        ),
        MenuItem(
            id: UUID(),
            MenuCategoryId: UUID(),
            name: "Pizza",
            restaurantName: "Pizza Corner",
            price: "180",
            description: "Thin crust pizza with mozzarella & basil",
            image: "pizza"
        ),
        MenuItem(
            id: UUID(),
            MenuCategoryId: UUID(),
            name: "Nachos",
            restaurantName: "SnackHub",
            price: "150",
            description: "Crispy nachos topped with jalapenos & cheese",
            image: "tacos"
        ),
        MenuItem(
            id: UUID(),
            MenuCategoryId: UUID(),
            name: "Pasta",
            restaurantName: "Italiano Café",
            price: "200",
            description: "Creamy Alfredo pasta with garlic bread",
            image: "pasta"
        )
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradientView()

                VStack(alignment: .leading) {
                    FavoritesTopBar()

                    List {
                        ForEach(favoriteMenuItems) { item in
                            FavoriteDishCard(menuItem: item, showRestaurant: true)
                        }
                    }
                    .listStyle(.plain)
                    .cornerRadius(24)
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesDishesView()
}

// MARK: - Card

struct FavoriteDishCard: View {
    var menuItem: MenuItem
    var showRestaurant: Bool

    var body: some View {
        MenuItemCardView(
            menuItem: menuItem,
            showRestaurant: showRestaurant
        )
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.gray.opacity(0.1))
                .stroke(Color.gray.opacity(0.2))
        )
    }
}

// MARK: - Top Bar

struct FavoritesTopBar: View {
    var body: some View {
        HStack {
            Text("Favorite Dishes")
                .font(.title2)
                .foregroundColor(.black)

            Spacer()

            Button("Favorite Restaurants") {
                // TODO: navigate to Favorite Restaurants screen
            }
            .font(.title2)
            .foregroundColor(.black)
        }
        .padding()
    }
}
