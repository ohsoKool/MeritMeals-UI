import SwiftUI

struct UserAddressesView: View {
    @StateObject private var addressVM = AddressViewModel()

    // Temporary userId for testing
    let userId: UUID = .init(uuidString: "679f01cc-f673-475d-abb8-5e9e1a6e397e")!

    var body: some View {
        ZStack {
            LinearGradientView()
            VStack {
                InputDataFieldView(placeholderText: "Search your saved addresses")

                List {
                    ForEach(addressVM.addresses, id: \.id) { address in
                        UserAddressCard(address: address)
                            .environmentObject(addressVM)
                    }
                }
                .listStyle(.plain)
                .cornerRadius(24)

                NavigationLink(destination: AddNewUserAddress()) {
                    HStack {
                        Spacer()
                        SaveButtonView(InvertedButton: true, buttonName: "ADD NEW ADDRESS")
                        Spacer()
                    }
                }
            }
            .navigationTitle("ADDRESSES")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await addressVM.fetchUserAddresses(id: userId)
            }
        }
    }
}

#Preview {
    UserAddressesView()
}

struct UserAddressCard: View {
    @EnvironmentObject var addressVM: AddressViewModel
    var address: Address

    var addressTypeIcon: String {
        switch address.addressType {
        case "Home": return "house"
        case "Work": return "briefcase"
        case "College": return "building.columns"
        default: return "mappin.and.ellipse"
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Header with icon + type
            HStack(spacing: 8) {
                Image(systemName: addressTypeIcon)
                    .foregroundColor(.gray)
                Text(address.addressType)
                    .font(.headline)
                    .foregroundColor(.black)
            }

            // Address text
            Text("\(address.street), \(address.city), \(address.state), \(address.postalCode)")
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.7))
                .fixedSize(horizontal: false, vertical: true) // Wraps text

            // Phone number
            if let phone = address.phoneNumber {
                Text("Phone number: \(phone)")
                    .font(.subheadline)
                    .foregroundColor(.black.opacity(0.7))
            }

            // Actions (Edit / Delete)
            HStack(spacing: 30) {
                Button("EDIT") {
                    Task {
                        await addressVM.updateAddress(address: address)
                    }
                }
                .foregroundColor(.orange)

                Button("DELETE") {
                    Task {
                        await addressVM.deleteAddress(id: address.id)
                    }
                }
                .foregroundColor(.orange)
            }
            .font(.subheadline.bold())
        }
        .padding(15)
    }
}
