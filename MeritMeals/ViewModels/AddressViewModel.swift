import Combine
import Foundation

@MainActor
class AddressViewModel: ObservableObject {
    @Published var addresses: [Address] = []

    func fetchUserAddresses(id: UUID) async {
        // 1. Get the url for the End point
        guard let url = URL(string: "http://127.0.0.1:8080/addresses/user/\(id)") else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else {
                print("Error: HTTP status code not 200")
                return
            }
            let decodedAddress = try AppJSONDecoder.shared.decode([Address].self, from: data)
            addresses = decodedAddress
        } catch {
            print("Error fetching user:", error)
        }
    }

    func deleteAddress(id: UUID) async {
        guard let url = URL(string: "http://127.0.0.1:8080/addresses/address/\(id)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 204 {
                // Remove locally from the array
                addresses.removeAll { $0.id == id }
            } else {
                print("Delete failed, status: \(response)")
            }
        } catch {
            print("Error deleting address:", error)
        }
    }

    func updateAddress(address: Address) async {
        guard let url = URL(string: "http://127.0.0.1:8080/addresses/address/\(address.id)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let body = try JSONEncoder().encode(address)
            request.httpBody = body
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                // Optionally refresh
                await fetchUserAddresses(id: address.userId)
            } else {
                print("Update failed, status: \(response)")
            }
        } catch {
            print("Error updating address:", error)
        }
    }
}
