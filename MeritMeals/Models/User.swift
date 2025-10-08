import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let fullName: String
    let email: String
    let mobile: String
    let dob: Date?
    let gender: String?

    var addresses: [Address]?
}
