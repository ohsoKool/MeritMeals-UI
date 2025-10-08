import SwiftUI

struct CategoryScrollView: View {
    @State private var selectedCategory: String = "Chinese"
    var categories: [String] = ["Chinese", "Indian", "Italian", "Mexican", "Thai", "Greek", "French"]
    @Namespace private var animationNamespace

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(
                            ZStack {
                                if category == selectedCategory {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.orange.opacity(0.3))
                                        .matchedGeometryEffect(id: "highlight", in: animationNamespace)
                                }
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .cornerRadius(20)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectedCategory = category
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    CategoryScrollView(categories: ["Chinese", "Indian", "Italian", "Mexican", "Thai", "Greek", "French"])
}
