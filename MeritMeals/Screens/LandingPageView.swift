import SwiftUI

struct LandingPageView: View {
    @EnvironmentObject var auth: AuthModel
    @EnvironmentObject var userVM: UserViewModel

    @State private var animateBurger = false
    @State private var animateGradient = false
    @State private var animateText = false
    @State private var animateExplore = false

    var landingPageImage: String = "burger"

    var body: some View {
        NavigationStack {
            if auth.isLoggedIn {
                BottomNavbarView()
                    .environmentObject(userVM)
            } else {
                ZStack {
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
                        Image(landingPageImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .offset(y: animateBurger ? -20 : 20)

                        HStack {
                            Text("Welcome to")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .opacity(animateText ? 1 : 0)
                                .offset(y: animateText ? 0 : 15)

                            Text("MeritMeals")
                                .font(.custom("DancingScript-Bold", size: 32))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .opacity(animateText ? 1 : 0)
                                .offset(y: animateText ? 0 : 15)
                        }

                        NavigationLink("Explore", destination: EnterMobileView())
                            .font(.title3)
                            .padding()
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(.orange.opacity(0.2))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 24)
                                            .stroke(.black, lineWidth: 2)
                                    )
                            )
                            .opacity(animateExplore ? 1 : 0)
                            .offset(y: animateExplore ? 0 : 20)
                            .shadow(color: .orange.opacity(0.6), radius: animateExplore ? 15 : 5)
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) { animateBurger = true }
                        withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) { animateGradient = true }
                        withAnimation(.easeOut(duration: 1.5)) { animateText = true }
                        withAnimation(.easeInOut(duration: 1.5)) { animateExplore = true }
                    }
                }
            }
        }
    }
}

#Preview {
//    let userData = User(id: UUID(), fullName: "Rishi", email: "rishi@gmail.com", mobile: "8328285257", dob: Date(), gender: "Male")
    LandingPageView()
}
