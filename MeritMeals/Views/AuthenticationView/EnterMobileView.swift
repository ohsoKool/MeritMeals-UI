import SwiftUI

struct EnterMobileView: View {
    @State private var mobile: String = ""
    @FocusState private var isFocused: Bool
    @State private var hasAgreedToPolicy: Bool = false
    @State private var navigateToOtp: Bool = false
    @StateObject private var userVM = UserViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradientView()

                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome to MeritMeals")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)

                    Text("Create an account in few easy steps")
                        .font(.title3)
                        .foregroundColor(.gray.opacity(0.8))
                        .fontWeight(.medium)

                    Text("Mobile Number:")
                        .foregroundColor(.black)
                        .fontDesign(.monospaced)

                    TextField("   Enter Phone Number", text: $mobile)
                        .frame(height: 60)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white.opacity(0.6))
                                .stroke(.gray.opacity(0.6), lineWidth: 1)
                        )

                    Toggle(isOn: $hasAgreedToPolicy) {
                        HStack(spacing: 0) {
                            Text("I agree to MeritMeals' ")
                            Text("User Agreement & Privacy Policy")
                                .foregroundColor(.blue)
                        }
                    }

                    if hasAgreedToPolicy {
                        Button(action: {
                            Task {
                                userVM.mobile = mobile
                                await userVM.sendOtp()
                                if userVM.errorMessage == nil {
                                    DispatchQueue.main.async {
                                        navigateToOtp = true
                                    }
                                }
                            }
                        }) {
                            Text("Next")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .disabled(mobile.isEmpty || !hasAgreedToPolicy || userVM.isLoading)

                        if userVM.isLoading {
                            ProgressView("Sending OTP...")
                        }

                        if let error = userVM.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.footnote)
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(isPresented: $navigateToOtp) {
                OtpView(mobile: mobile)
                    .environmentObject(userVM)
            }

            .onAppear {
                DispatchQueue.main.async {
                    isFocused = true
                }
            }
        }
    }
}
