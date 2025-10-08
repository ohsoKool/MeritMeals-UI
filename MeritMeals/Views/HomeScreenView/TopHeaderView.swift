import SwiftUI

struct TopHeaderView: View {
    var logoImageName: String
    var appName: String
    var userAvatar: String
    var fontName: String = "DancingScript-Bold"
    var fontSize: CGFloat = 35

    // Add size parameters because it's difficult to control the sizing from the parent
    var logoSize: CGSize = .init(width: 50, height: 50)
    var avatarSize: CGSize = .init(width: 50, height: 50)

    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Image(logoImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: logoSize.width, height: logoSize.height)

                Text(appName)
                    .font(.custom(fontName, size: fontSize))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            Spacer()
            NavigationLink(destination: UserAddressesView()) {
                Image(systemName: userAvatar)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: avatarSize.width, height: avatarSize.height)
                    .foregroundColor(.black)
            }
        }
    }
}

// #Preview {
//    TopHeaderView(
//        logoImageName: "unieatslogo",
//        appName: "UniEats",
//        userAvatar: "person.crop.circle"
//    )
//    .frame(height: 70) // parent can control height
//    .padding(.horizontal) // parent controls padding
// }
