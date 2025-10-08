import SwiftUI

struct SearchBarView: View {
    @State private var inputText: String = ""
    @FocusState private var isFocused: Bool

    // Configurable parameters
    var iconSize: CGSize = .init(width: 20, height: 20)
    var placeholder: String = "Search Product, Dish"
    var cornerRadius: CGFloat = 10
    var strokeColor: Color = .black
    var strokeWidth: CGFloat = 1
    var backgroundColor: Color = .gray.opacity(0.1)

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: iconSize.width, height: iconSize.height)
                .foregroundColor(.gray)

            TextField(placeholder, text: $inputText)
                .foregroundColor(.primary)
                .focused($isFocused)
                .onSubmit { isFocused = false }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(strokeColor, lineWidth: strokeWidth)
                )
        )
        .onTapGesture { isFocused = true }
    }
}

#Preview {
    SearchBarView(iconSize: CGSize(width: 25, height: 25))
        .padding(.horizontal)
}
