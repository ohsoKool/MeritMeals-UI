import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let fullName: String
    let email: String
    let mobile: String
    let dob: Date?
    let gender: String?
    var addresses: [Address]?

    init(
        id: UUID,
        fullName: String,
        email: String,
        mobile: String,
        dob: Date?,
        gender: String?,
        addresses: [Address]? = nil
    ) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.mobile = mobile
        self.dob = dob
        self.gender = gender
        self.addresses = addresses
    }
}
