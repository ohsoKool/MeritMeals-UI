import SwiftUI

struct FeaturedDishView: View {
    @State private var animateDish = false

    var featuredDish: String
    var imageSize: CGSize = .init(width: 150, height: 150)
    var cornerRadius: CGFloat = 16
    var shadowRadius: CGFloat = 3

    var body: some View {
        Image(featuredDish)
            .resizable()
            .scaledToFit()
//        aspectRatio(contentMode: .fill)
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
            .opacity(animateDish ? 0.8 : 1)
            .offset(x: animateDish ? 60 : -60)
            .animation(
                .easeInOut(duration: 2).repeatForever(autoreverses: true),
                value: animateDish
            )
            .onAppear {
                animateDish = false
                DispatchQueue.main.async {
                    animateDish = true
                }
            }
    }
}

#Preview {
    FeaturedDishView(
        featuredDish: "burger",
        imageSize: CGSize(width: 180, height: 180)
    )
}
