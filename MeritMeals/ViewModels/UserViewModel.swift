import Combine
import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var mobile: String = ""
    @Published var otp: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let baseURL = AppConfig.baseURL
}

extension UserViewModel {
    func sendOtp() async {
        guard !mobile.isEmpty else {
            errorMessage = "Please enter your phone number"
            return
        }

        isLoading = true
        defer { isLoading = false }

        let url = URL(string: "\(baseURL)/users/send-otp")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload = ["mobile": mobile]
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

        do {
            let (_, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }

            if httpResponse.statusCode == 200 {
                print("OTP sent successfully!")
            } else {
                errorMessage = "Failed to send OTP, Try again!"
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    // --- Function to verify otp ---
    func verifyOtp(authModel: AuthModel) async {
        guard !mobile.isEmpty, !otp.isEmpty else {
            errorMessage = "Enter your mobile and OTP"
            return
        }

        isLoading = true
        defer { isLoading = false }

        let url = URL(string: "\(baseURL)/users/verify-otp")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload = ["mobile": mobile, "otp": otp]
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }

            if httpResponse.statusCode == 200 {
                let user = try JSONDecoder().decode(User.self, from: data)
                print("OTP verified. User: \(user.fullName)")
                authModel.login(user: user)
            } else {
                errorMessage = "Invalid OTP or verification failed"
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
