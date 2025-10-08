import Foundation

struct Dish: Identifiable, Codable {
    let id: UUID
    let restaurantId: UUID?
    let name: String
    let price: Int
    let description: String
    let image: String
    let restaurant: String
    let displayMode: Bool?

    init(
        id: UUID = UUID(),
        restaurantId: UUID? = nil,
        name: String = "",
        price: Int = 0,
        description: String = "",
        image: String = "",
        restaurant: String = "",
        displayMode: Bool? = false
    ) {
        self.id = id
        self.restaurantId = restaurantId
        self.name = name
        self.price = price
        self.description = description
        self.image = image
        self.restaurant = restaurant
        self.displayMode = displayMode
    }
}
