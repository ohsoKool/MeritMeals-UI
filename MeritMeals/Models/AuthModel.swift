import Combine
import Foundation

class AuthModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User? = nil

    func login(user: User) {
        currentUser = user
        isLoggedIn = true
    }

    func logout(user: User) {
        currentUser = nil
        isLoggedIn = false
    }
}
