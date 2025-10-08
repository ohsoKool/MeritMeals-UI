import Foundation

struct Vendor: Codable, Identifiable {
    let id: UUID
    let restaurants: [Restaurant]
    let street: String
    let city: String
    let state: String
    let postalCode: String
    let mobile: String
    let email: String
}
