import SwiftUI

@main
struct MeritMealsApp: App {
    @StateObject private var authManager = AuthModel()
    @StateObject private var userVM = UserViewModel()

    init() {
        print("The Application has started!")
        UIView.appearance().overrideUserInterfaceStyle = .light
    }

    var body: some Scene {
        WindowGroup {
            LandingPageView()
                .environmentObject(authManager)
                .environmentObject(userVM)
        }
    }
}
