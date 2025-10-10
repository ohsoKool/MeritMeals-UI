import SwiftUI
import UIKit

struct AddItemView: View {
    // Normal way to write haptic feedback code
//    let generator = UIImpactFeedbackGenerator(style: .medium)
//    generator.impactOccurred()
    func performHaptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

    @State private var animateButton: Bool = false
    var menuItem = MenuItem()
    @State private var itemCount: Int = 0
    var body: some View {
        // Here self indicates the menuItem variable of this view
        if self.itemCount == 0 {
            Button("Add") {
                self.performHaptic(.medium)
                withAnimation(
                    .spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.1)
                ) {
                    self.itemCount += 1
                    print("\(self.menuItem.name) has been added to your Cart x \(self.itemCount)")
                    self.animateButton.toggle()
                }
            }
            .CartButtonStyle()
            .controlSize(.regular)

        } else {
            HStack {
                Button("+") {
                    self.performHaptic(.light)

                    self.itemCount += 1
                    print("\(self.menuItem.name) has been added to your Cart x \(self.itemCount)")
                    self.animateButton.toggle()
                }
                .CartButtonStyle()

                Text("\(self.itemCount)")
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .shadow(radius: 6)

                Button("-") {
                    self.performHaptic(.light)

                    self.itemCount -= 1
                    print("\(self.menuItem.name) has been added to your Cart x \(self.itemCount)")
                    self.animateButton.toggle()
                }
                .CartButtonStyle()
            }
        }
    }
}

extension View {
    func CartButtonStyle() -> some View {
        self
            .buttonStyle(.bordered)
            .tint(.white)
            .background(Color.black)
            .clipShape(Capsule())
            .shadow(radius: 6)
    }
}

#Preview {
    AddItemView()
}
