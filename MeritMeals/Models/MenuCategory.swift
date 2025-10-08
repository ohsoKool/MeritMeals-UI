import Foundation

struct MenuCategory: Codable, Identifiable {
    let id: UUID
    let restaurantId: UUID
    let name: String
    let menuItems: [MenuItem]
}
