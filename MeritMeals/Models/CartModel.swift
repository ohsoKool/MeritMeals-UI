import Foundation

import Combine

enum CartStatus: String, Codable {
    case started, pending, successful
}

class CartModel: ObservableObject {
    @Published var isCartActive: Bool = false
    @Published var cartItems: [MenuItem] = []
    @Published var quantitySelected: [Int] = []

    let cartId: UUID
    let price: String
    let status: CartStatus

    // Default initializer with sensible defaults
    init(cartId: UUID = UUID(), price: String = "0", status: CartStatus = .pending) {
        self.cartId = cartId
        self.price = price
        self.status = status
    }

//    func addItem(dish: MenuItem) {
//        if let index = cartItems.firstIndex(where: { $0.id == dish.id }) {
//            quantitySelected[index] += 1
//            isCartActive = true
//        } else {
//            cartItems.append(dish)
//            quantitySelected.append(1)
//            isCartActive = true
//        }
//    }
}

// Use Class only when you need App Changes that need to be shared
// Because Classes are reference Types and can conform to ObservableObject
