import SwiftUI

struct AddItemView: View {
    @State private var animateButton: Bool = false
    var menuItem = MenuItem()
    @State private var itemCount: Int = 0
    var body: some View {
        if self.itemCount == 0 {
            Button("Add") {
                self.itemCount += 1
                print("\(self.menuItem.name) has been added to your Cart x \(self.itemCount)")
            }
            .CartButtonStyle()
            .controlSize(.regular)
//            .onTapGesture {
//                animateButton.toggle()
//            }
//            withAnimation(.easeInOut(duration: 0.2)) {
//                self.itemCount += 1
//            }

//            .animation(.easeInOut(duration: 0.8), value: $animateButton)
        } else {
            HStack {
                Button("+") {
                    self.itemCount += 1
                    print("\(self.menuItem.name) has been added to your Cart x \(self.itemCount)")
                }
                .CartButtonStyle()

                Text("\(self.itemCount)")
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .shadow(radius: 6)

                Button("-") {
                    self.itemCount -= 1
                    print("\(self.menuItem.name) has been removed from your cart")
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
