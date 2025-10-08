import Foundation

struct Favorite: Codable, Identifiable {
    let id: UUID
    let restaurants: [Restaurant]
    let dishes: [Dish]
}
