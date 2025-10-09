import SwiftUI

struct PopularRestaurantsView: View {
    var horizontalList: [Int] = [1, 2, 3, 4, 5]
    var restaurantBanner: [String] = ["kortyard", "burgerking", "kfc", "dominos", "subway", "pizzahut"]
    var restaurantName: [String] = ["Kortyard Cafe", "Burger King", "KFC", "Domino's", "Subway", "Pizza Hut"]
    var restaurantLocation: [String] = ["Jubilee Hills", "Tolichowki", "Shaikpet", "O.U.Colony", "Mehdipatnam", "Kondapur"]
    var customFontName: String = "DancingScript-Bold"

    var body: some View {
//        NavigationStack {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Popular Restaurants")
                    .font(.title3)
                    .fontWeight(.medium)

                Spacer()
                NavigationLink(destination: RestaurantsScreen()) {
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(.orange)
                        .padding(8)
                        .overlay(
                            Circle()
                                .stroke(.gray.opacity(0.5))
                        )
                }
                .buttonStyle(.plain)
            }
            .padding([.horizontal, .top], 16)
//            .padding()

            // Horizontal scroll
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Array(zip(zip(restaurantBanner, restaurantName), restaurantLocation)), id: \.0.0) {
                        pair, location in
                        let banner = pair.0
                        let name = pair.1
//                            let menuItem = MenuItem(
//                                name: name,
//                                restaurantName: name,
//                                price: "100",
//                                description: "Sample description",
//                                image: banner
                        //                            )
                        NavigationLink(
                            destination: RestaurantMenu(
                                restaurantName: name,
                                restaurantLocation: location,
                                restaurantRating: "4.4k (145k+)"
                            )
                        )
                            /* .navigationTransition(.slide)*/ {
                                AnimatedRestaurantCardView(
                                    restaurantBanner: banner,
                                    restaurantName: name,
                                    restaurantLocation: location,
                                    customFontName: customFontName
                                )
                        }
//                        .buttonStyle(.plain)
                        .foregroundColor(.black)
//                        .navigationLinkIndicatorVisibility(.hidden)
                    }
                }
                .padding(12)
            }
        }
        .padding(.vertical, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

// }

/// Separate card with independent animation state
struct AnimatedRestaurantCardView: View {
    var restaurantBanner: String = "burgerking"
    var restaurantName: String = "Burger King"
    var restaurantLocation: String = "Tolichowki"
    var customFontName: String = "DancingScript-Bold"
    @State private var animate = true

    var body: some View {
        RestaurantCardView(restaurantBanner: restaurantBanner, restaurantName: restaurantName, restaurantLocation: restaurantLocation, customFontName: customFontName)
//            .opacity(animate ? 1 : 0.8)
            .offset(x: animate ? -30 : 0)
            .shadow(radius: 4)
            .onAppear {
                withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    animate = false
                }
            }
    }
}

#Preview {
    PopularRestaurantsView()
//        .padding(24)
//    AnimatedRestaurantCardView()
}
