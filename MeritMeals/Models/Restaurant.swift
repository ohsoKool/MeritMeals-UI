import Foundation

struct Restaurant: Codable, Identifiable {
    let id: UUID
    let vendorId: UUID
    let name: String
    let street: String
    let city: String
    let state: String
    let postalCode: String
    let ratings: String?
    let isPureVeg: Bool
    let Cuisine: [String]
    let image: String
    var MenuCategories: [MenuCategory]?
    var documents: [Document]
}
