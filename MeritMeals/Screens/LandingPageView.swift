import SwiftUI

struct LandingPageView: View {
    @State private var showHome = false
    @State private var animateBurger = false
    @State private var animateGradient = false
    @State private var animateText = false
    @State private var animateExplore = false

    @EnvironmentObject var auth: AuthModel
    @State private var user: User?

    var landingPageImage: String = "burger"

    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color.orange.opacity(0.6),
                        Color.orange.opacity(0.4),
                        Color.orange.opacity(0.2),
                        Color.white
                    ],
                    startPoint: animateGradient ? .topLeading : .bottomTrailing,
                    endPoint: animateGradient ? .bottomLeading : .topLeading
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    // Floating burger image
                    Image(landingPageImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .offset(y: animateBurger ? -20 : 20)

                    // Welcome text
                    HStack {
                        Text("Welcome to")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .opacity(animateText ? 1 : 0) // fade in
                            .offset(y: animateText ? 0 : 15) // slide upText("Welcome to MeritMeals")
                        Text("MeritMeals")
                            .font(.custom("DancingScript-Bold", size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .opacity(animateText ? 1 : 0) // fade in
                            .offset(y: animateText ? 0 : 15) // slide up
                    }

                    // Explore button
                    Button(action: { showHome = true }) {
                        Text("Explore")
                            .font(.title3)
                            .padding()
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(.orange.opacity(0.2))
                                    .stroke(.black, lineWidth: 2)
                            )
                            .opacity(animateExplore ? 1 : 0) // fade in
                            .offset(y: animateExplore ? 0 : 20) // slide up
                            .shadow(
                                color: .orange.opacity(0.6),
                                radius: animateExplore ? 15 : 5
                            )
                    }
//                    .transition(.slide)
                }
                .onAppear {
                    // Attach animations explicitly
                    // Old code had animations for each view seperately instead of that we do it inside this onAppear
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        animateBurger = true
                    }
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                        animateGradient = true
                    }
                    withAnimation(.easeOut(duration: 1.5)) {
                        animateText = true
                    }
                    withAnimation(.easeInOut(duration: 1.5)) {
                        animateExplore = true
                    }
                }
            }.fullScreenCover(isPresented: $showHome) { EnterMobileView().interactiveDismissDisabled(
                true
            )
            }
        }
    }
}

#Preview {
//    let userData = User(id: UUID(), fullName: "Rishi", email: "rishi@gmail.com", mobile: "8328285257", dob: Date(), gender: "Male")
    LandingPageView()
}
