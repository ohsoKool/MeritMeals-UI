import Foundation

struct Address: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let name: String? // Name for someone else
    let phoneNumber: String? // Phone number
    let instructions: String? // Delivery instructions
    let addressType: String // Home / Work / Other
    let street: String
    let city: String
    let state: String
    let postalCode: String
    let isDefault: Bool
}
