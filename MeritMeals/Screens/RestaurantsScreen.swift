import SwiftUI

struct RestaurantsScreen: View {
    var restaurantNames: [String] = ["Paradise", "Pista House", "Mehfil", "Shahghouse", "Mandaar"]
    var restaurantLocation: [String] = ["Paradise Circle", "Kondapur", "Shaikpet", "Tolichowki", "4 Seasons"]
    var restaurantBanner: [String] = ["kortyard", "burgerking", "kfc", "dominos", "subway", "pizzahut"]
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradientView()
                VStack(alignment: .leading) {
//                TopRestaurantBar()
//                Divider()
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 15) {
                            ForEach(0 ..< restaurantNames.count, id: \.self) { index in
                                RestaurantCardView(
                                    restaurantBanner: restaurantBanner[index],
                                    restaurantName: restaurantNames[index],
                                    restaurantLocation: restaurantLocation[index]
                                )
                                Divider()
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("RESTAURANTS")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    RestaurantsScreen()
}

struct TopRestaurantBar: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
//            UserInfoView(redpin: "redpin", userlocation: "Hyderabad,Telangana,India")
//                .padding(.all, 0)
//                .border(.black)
//            Text("All Restaurants")
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .padding(.all, 0)
//                .border(.black)
        }
    }
}
