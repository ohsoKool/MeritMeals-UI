import SwiftUI

struct OtpView: View {
    let mobile: String
    let otpLength: Int = 6
    @State private var isCorrect: Bool = false
    @State private var hasAttempted: Bool = false
    @State private var otpValues: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    var body: some View {
        ZStack {
            LinearGradientView()
            VStack(alignment: .leading, spacing: 12) {
                Text("Verify Account with OTP")
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)

                Text("We've sent a 6 digit code to +91\(mobile)")
                    .font(.callout)
                    .foregroundColor(.gray.opacity(0.8))
                HStack {
                    ForEach(0 ..< otpLength, id: \.self) {
                        index in
                        TextField("", text: $otpValues[index])
                            .textContentType(.oneTimeCode)
                            .keyboardType(.numberPad)
                            .foregroundColor(.gray.opacity(0.8))
                            .frame(width: 50, height: 50)
                            .multilineTextAlignment(.center)
                            .focused($focusedIndex, equals: index)
                            .onChange(of: otpValues[index]) { _, newValue in
                                if !newValue.isEmpty && index < otpLength - 1 {
                                    focusedIndex! = focusedIndex! + 1
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(isCorrect ? .green : hasAttempted ? .red : .black))
                    }
                }

                Text(
                    isCorrect ? "Accepted" :
                        hasAttempted ? "Incorrect Code! Please try again" :
                        "Enter your OTP")
                    .foregroundColor(
                        isCorrect ? .green :
                            hasAttempted ? .red :
                            .gray.opacity(0.8)
                    )
                    .font(.callout)

                Button("Resend Code") {
                    print("code resent")
                }
                .foregroundStyle(.blue)
            }
            .onAppear {
                focusedIndex = 0
            }
        }
    }
}

#Preview {
    OtpView(mobile: "8328285257")
}
