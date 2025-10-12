import SwiftUI

struct OtpView: View {
    let mobile: String
    let otpLength: Int = 6
    @State private var isCorrect: Bool = false
    @State private var hasAttempted: Bool = false
    @State private var otpValues: [String] = Array(repeating: "", count: 6)

    @FocusState private var focusedIndex: Int?

    @State private var canResend = true
    @State private var secondsRemaining = 0
    // This is a state variable to invalidate the timer if the user navigated back to the home screen
    @State private var resendTimer: Timer?

    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var authModel: AuthModel

    func startResendCoolDown() {
        canResend = false
        secondsRemaining = 30
        // Invalidate any old timers
        resendTimer?.invalidate()

        // Create the timer first
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                timer.invalidate()
                canResend = true
            }
        }

        // Set a small tolerance for efficiency
        timer.tolerance = 0.1

        // Add to main run loop so UI updates correctly even during gestures/navigation
        RunLoop.main.add(timer, forMode: .common)
        resendTimer = timer
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradientView()
                    .ignoresSafeArea()

                VStack(alignment: .center, spacing: 20) {
                    Text("Verify Account with OTP")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)

                    Text("We've sent a 6 digit code to +91\(mobile)")
                        .font(.callout)
                        .foregroundColor(.gray.opacity(0.8))

                    HStack {
                        ForEach(0 ..< otpLength, id: \.self) { index in
                            TextField("", text: $otpValues[index])
                                // .oneTimeCode tells ios to show the otp in the autofill
                                .textContentType(.oneTimeCode)
                                .keyboardType(.numberPad)
                                .foregroundColor(.gray.opacity(0.8))
                                .frame(width: 50, height: 50)
                                .multilineTextAlignment(.center)
                                .focused($focusedIndex, equals: index)
                                .onChange(of: otpValues[index]) { _, newValue in
                                    if !newValue.isEmpty && index < otpLength - 1 {
                                        focusedIndex = index + 1
                                    }
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(isCorrect ? .green : hasAttempted ? .red : .black)
                                )
                        }
                    }

                    Text(
                        isCorrect ? "Accepted" :
                            hasAttempted ? "Incorrect Code! Please try again" :
                            "Enter your OTP"
                    )
                    .foregroundColor(
                        isCorrect ? .green :
                            hasAttempted ? .red :
                            .gray.opacity(0.8)
                    )
                    .font(.callout)

                    Button("Verify OTP") {
                        Task {
                            userVM.mobile = mobile
                            userVM.otp = otpValues.joined()

                            await userVM.verifyOtp(authModel: authModel)

                            if userVM.errorMessage == nil {
                                isCorrect = true
                                hasAttempted = false
                                print("OTP Verified")

                                if let user = userVM.user {
                                    authModel.login(user: user)
                                }
                            } else {
                                isCorrect = false
                                hasAttempted = true
                                print("OTP Verification Failed: \(userVM.errorMessage!)")
                            }
                        }
                    }

                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)

                    if userVM.isLoading {
                        ProgressView("Verifying OTP...")
                    }

                    if let error = userVM.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.footnote)
                    }

                    Button("Resend Code") {
                        Task { await userVM.sendOtp()
                            startResendCoolDown()
                        }
                    }
                    .disabled(!canResend)
                    .foregroundStyle(.blue)
                    if !canResend {
                        Text("Resend in \(secondsRemaining)s")
                            .font(.caption)
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
                .padding()
                .onAppear { focusedIndex = 0 }
                .onDisappear {
                    resendTimer?.invalidate()
                }
            }
        }
    }
}

#Preview {
    OtpView(mobile: "8328285257")
        .environmentObject(UserViewModel())
        .environmentObject(AuthModel())
}
