// import SwiftUI
//
// struct RootView: View {
//    @State private var currentScreen: Screen = .landing
//
//    enum Screen {
//        case landing
//        case home
//    }
//
//    var body: some View {
//        ZStack {
//            // Landing Page
//            if currentScreen == .landing {
//                LandingPageView(onContinue: {
//                    withAnimation(.easeInOut(duration: 0.6)) {
//                        currentScreen = .home
//                    }
//                })
//                .transition(.move(edge: .leading))
//                .zIndex(1) // ensure landing is on top initially
//            }
//
//            // Home Page
//            if currentScreen == .home {
//                HomeView(
//                    onLogout: {
//                        withAnimation(.easeInOut(duration: 0.6)) {
//                            currentScreen = .landing
//                        }
//                    },
//                    fullName: "Loading..."
//                )
//                .transition(.move(edge: .leading))
//                .zIndex(2) // home above landing when active
//            }
//        }
//        .animation(.easeInOut, value: currentScreen)
//    }
// }
