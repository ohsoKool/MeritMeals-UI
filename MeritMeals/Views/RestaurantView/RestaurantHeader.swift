import SwiftUI

struct RestaurantHeader: View {
    var restaurantName: String
    var restaurantLocation: String
    var restaurantRating: String

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(restaurantName)
                .font(.custom("DancingScript-Bold", size: 35))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding([.horizontal, .top], 8)
                .padding(.bottom, 0)

            HStack(spacing: 0) {
//                Image(systemName: "redpin")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .padding(.all, 8)

                Text(restaurantLocation)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding(.all, 8)

                Text(restaurantRating)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding(.all, 10)
            }
            .padding(.bottom, 4)
        }
//        .border(.black)
    }
}

#Preview {
    RestaurantHeader(restaurantName: "The Shawarma Wrapz", restaurantLocation: "O.U.Colony", restaurantRating: "4.5 ⭐")
}
