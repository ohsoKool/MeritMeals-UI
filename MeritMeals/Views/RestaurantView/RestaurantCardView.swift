//
//  RestaurantCardView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/20/25.
//
import SwiftUI

struct RestaurantCardView: View {
    var restaurantBanner: String = "kortyard"
    var restaurantName: String = "Kortyard Cafe"
    var restaurantLocation: String = "Jubilee Hills"
    var customFontName: String = "DancingScript-Bold"
    var body: some View {
        HStack {
            Image(restaurantBanner)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 100)
                .clipped()
                .cornerRadius(16)
                .background(RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 4))
            VStack(alignment: .leading, spacing: 10) {
                Text(restaurantName)
                    .font(.custom(customFontName, size: 25))
                    .fontWeight(.heavy)
                HStack {
                    Text("4.4")
                        .font(.subheadline)
                    Text("(145K+)")
                        .font(.subheadline)
                }
                Text(restaurantLocation)
                    .font(.subheadline)
            }
            .padding()
        }
//        .padding()
//        .background(RoundedRectangle(cornerRadius: 16)
//            .stroke(.black.opacity(0.3))
//            .fill(.white))
    }
}

#Preview {
    RestaurantCardView()
}
