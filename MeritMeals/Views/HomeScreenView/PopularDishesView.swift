import SwiftUI

struct PopularDishesView: View {
    var recommendedProducts: [String] = ["burgerr", "pizza", "dalchawal", "biryani", "sandwich"]
    var recommendedProductNames: [String] = ["Burger", "Pizza", "Dal Chawal", "Biryani", "Sandwich"]
    var body: some View {
        VStack {
            HStack {
                Text("Popular Dishes")
                    .font(.title3)
                    .fontWeight(.medium)

                Spacer()

                Image(systemName: "arrow.up.right")
                    .foregroundColor(.orange)
                    .padding(8)
                    .overlay(
                        Circle()
                            .stroke(.gray.opacity(0.5))
                    )
            }
            .padding([.horizontal, .top], 16)
            .padding(.bottom, 0)
//            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(zip(recommendedProducts, recommendedProductNames)), id: \.0) { recommendedProduct, recommendedProductName in
                        RecommendedProductCardView(recommendedProduct: recommendedProduct, recommendedProductName: recommendedProductName)
                    }
                }
            }
            .padding([.horizontal, .bottom], 8)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.4), lineWidth: 1)
        )
//        .padding()
    }
}

#Preview {
    PopularDishesView(recommendedProducts: ["burgerr", "pizza", "dalchawal", "biryani", "sandwich"], recommendedProductNames: ["Burger", "Pizza", "Dal Chawal", "Biryani", "Sandwich"])
}

struct RecommendedProductCardView: View {
    var recommendedProduct: String
    var recommendedProductName: String
    var body: some View {
        VStack {
            Image(recommendedProduct)
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.bottom, 2.5)
            Text(recommendedProductName)
                .font(.title3)
                .foregroundColor(Color(.black))
//                .padding(.top, 2.5)
                .padding([.leading, .trailing], 10)
                .padding([.bottom], 5)
        }
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 24)
            .stroke(Color.gray.opacity(0.3), lineWidth: 1))
        .shadow(radius: 15)
    }
}

// #Preview {
//    RecommendedProductCardView(recommendedProduct: "burger", recommendedProductName: "Burger")
// }
