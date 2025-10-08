//
//  BottomNavbarView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/17/25.
//

import SwiftUI

struct BottomNavbarView: View {
    var homeIcon: String = "house.fill"
    var favoritesIcon: String = "heart.fill"
    var cartIcon: String = "cart.fill"
    var settingsIcon: String = "gearshape.fill"
    var menuItem: MenuItem = .init()
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView(fullName: "Loading...")
            }
            .tabItem {
                Label("Home", systemImage: homeIcon)
            }
            .tag(0)
            
            NavigationStack {
                RestaurantMenu(
                    restaurantName: "The Shawarma Wrapz",
                    restaurantLocation: "O.U.Colony",
                    restaurantRating: "4.5⭐",
                )
            }
            .tabItem {
                Label("Cart", systemImage: cartIcon)
            }
            .tag(1)
            
            NavigationStack {
                FavoritesDishesView(favoriteMenuItems: [menuItem])
            }
            .tabItem {
                Label("Favorites", systemImage: favoritesIcon)
            }
            .tag(2)
            
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: settingsIcon)
            }
            .tag(3)
        }
//        .tint(.orange)
//        .toolbarBackground(Color.orange.opacity(0.1), for: .tabBar)
//        .toolbarBackground(.visible, for: .tabBar)
    }
}

#Preview {
    BottomNavbarView()
}
