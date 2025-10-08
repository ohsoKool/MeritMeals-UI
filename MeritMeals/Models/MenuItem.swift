import Foundation

struct MenuItem: Codable, Identifiable {
    let id: UUID
    let MenuCategoryId: UUID
    let name: String
    let restaurantName: String?
    let price: String
    let description: String
    let image: String
    let tags: [String]
    var itemAvailable: Bool

    init(
        id: UUID = UUID(),
        MenuCategoryId: UUID = UUID(),
        name: String = "",
        restaurantName: String? = "",
        price: String = "",
        description: String = "",
        image: String = "",
        tags: [String] = [],
        itemAvailable: Bool = true
    ) {
        self.id = id
        self.MenuCategoryId = MenuCategoryId
        self.name = name
        self.restaurantName = restaurantName
        self.price = price
        self.description = description
        self.image = image
        self.tags = tags
        self.itemAvailable = itemAvailable
    }
}
