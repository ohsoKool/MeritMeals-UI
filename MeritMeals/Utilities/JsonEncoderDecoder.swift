import Foundation

enum AppJSONDecoder {
    static let shared: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

enum AppJSONEncoder {
    static let shared: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase // Matches your backend
        encoder.dateEncodingStrategy = .iso8601 // Matches date format
        encoder.outputFormatting = [.prettyPrinted] // Optional, good for debugging
        return encoder
    }()
}
