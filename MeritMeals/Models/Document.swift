import Foundation

enum DocumentStatus: Codable {
    case pending, accepted, rejected
}

struct Document: Codable, Identifiable {
    let id: UUID
    let restaurantId: UUID
    let businessLicense: String
    let pan: String
    let bankStatement: String
    let gst: String
    let expiryDate: String
    let verifiedAt: Date?
    let status: DocumentStatus
    var notes: String?
}
