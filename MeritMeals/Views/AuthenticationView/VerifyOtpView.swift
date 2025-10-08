import SwiftUI

struct VerifyOtpView: View {
    var user: User
    // Indicates the number of boxes
    let otpLength: Int = 6
    // Store each digit
    @State private var otpValues: [String] = Array(repeating: "", count: 6)
    // To know which box currently has the focus of the keyboard
    @FocusState private var focusedIndex: Int?
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Verify Account with OTP")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)

            Text("We've sent a code to \(user.mobile)")
                .font(.subheadline)
                .foregroundColor(.black)
            HStack {
                // Repeats the loop from 0 to otpLength - 1
//                id:\.self means use the index number as the id
                // Index represent the current box number
                ForEach(0 ..< otpLength, id: \.self) { index in
                    // The first part of the TextField indicates empty label
                    // $ keeps the array and box in sync
                    TextField("", text: $otpValues[index])
                        .textContentType(.oneTimeCode)
                        .keyboardType(.numberPad)
                        // Centers the typed digit inside the box
                        .multilineTextAlignment(.center)
                        .frame(width: 60, height: 60)
                        .background(
                            RoundedRectangle(cornerRadius: 12).stroke(focusedIndex == index ? Color.blue : Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        // Links this TextField to the focusedIndex
                        .focused($focusedIndex, equals: index)
                        .onChange(of: otpValues[index]) { _, newValue in
                            // Keep only last digit if multiple typed/pasted
                            if newValue.count > 1 {
                                otpValues[index] = String(newValue.last!)
                            }
                            // Auto move to next box
                            if !newValue.isEmpty && index < otpLength - 1 {
                                focusedIndex = index + 1
                            }
                        }
                }
                HStack {
                    Button("Resend again") {
                        print("OTP resent")
                    }
                    Spacer()
                    Button("Verify") {
                        print("Verified")
                    }
                }
                .padding()
            }
            .padding()
            .onAppear {
                focusedIndex = 0
                // focus on first box when the view loads
            }
        }
    }
}

#Preview {
    let newUser = User(id: UUID(), fullName: "John Doe", email: "test@gmail.com", mobile: "+628123456789", dob: Date(), gender: "male")
    VerifyOtpView(user: newUser)
}
