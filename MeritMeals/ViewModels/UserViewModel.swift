import Combine
import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: User?

    func fetchUser(id: UUID) async {
        guard let url = URL(string: "http://127.0.0.1:8080/users/\(id)") else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else {
                print("Error: HTTP status code not 200")
                return
            }
            let decodedUser = try AppJSONDecoder.shared.decode(User.self, from: data)
            self.user = decodedUser
        } catch {
            print("Error fetching user:", error)
        }
    }
}
