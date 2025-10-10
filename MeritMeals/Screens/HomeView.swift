import SwiftUI

struct HomeView: View {
    @StateObject private var userVM = UserViewModel()
    @Binding var selectedTab: Int

    var onLogout: (() -> Void)? = nil
    var fullName: String
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradientView()
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        TopHeaderView(
                            logoImageName: "unieatslogo",
                            appName: "MeritMeals",
                            userAvatar: "person.crop.circle",
                            logoSize: CGSize(width: 50, height: 50),
                            avatarSize: CGSize(width: 50, height: 50)
                        )
                        .padding(.horizontal, 6)
//                        .border(.black)

                        UserInfoView(
                            fullName: userVM.user?.fullName ?? "Loading...",
                            redpin: "redpin",
                            userlocation: "Shaikpet, Hyderabad, India"
                        )
                        .padding(.all, 10)
//                        .border(.black)

                        SearchBarView(iconSize: CGSize(width: 25, height: 25))
                            .padding(.all, 10)

                        CategoryScrollView()
                            .frame(height: 60)
                            .padding(.horizontal)
//                            .border(.black)

//                        FeaturedDishView(featuredDish: "burger", imageSize: CGSize(width: 150, height: 150))
                        ////                            .border(.black)

                        PopularDishesView(recommendedProducts: ["burgerr", "pizza", "dalchawal", "biryani", "sandwich"], recommendedProductNames: ["Burger", "Pizza", "Dal Chawal", "Biryani", "Sandwich"])
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)

                        PopularRestaurantsView(selectedTab: $selectedTab)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
//                            .border(.black)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
//        .task {
//            if let uuid = UUID(uuidString: "679f01cc-f673-475d-abb8-5e9e1a6e397e") {
//                await userVM.fetchUser(id: uuid)
//            } else {
//                print("Invalid UUID")
//            }
//        }
    }
}

#Preview {
//    HomeView(
//        fullName: "Loading...",
//
//    )
}
