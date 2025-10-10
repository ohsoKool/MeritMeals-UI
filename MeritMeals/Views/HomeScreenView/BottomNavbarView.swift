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
    
    

    // selectedTab is a state variable which tracks which Tab is currently selected
    // 0 indicates that the current selected tab is 'tagItem 0'
    @State private var selectedTab: Int = 0

    var body: some View {
//        selection is an arguement expected by TabView
        // Selection binds tabView's active tab to the $selected tab
        TabView(selection: $selectedTab) {
            // NavigationStack is used because HomeView can have it's own navigation flow

            // We passed down the binding variable in HomeView which allows the variable to be used in the ChildView which re renders the parent View
            NavigationStack {
                HomeView(selectedTab: $selectedTab, fullName: "Loading...")
            }
            .tabItem {
                //                Image(systemName: homeIcon)
                //                Text("Home")
                // The above line of code is shorthand for the below
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
//            .disabled(true)
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
    }
}

#Preview {
    BottomNavbarView()
}
