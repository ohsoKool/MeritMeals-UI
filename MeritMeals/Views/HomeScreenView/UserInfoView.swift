//
//  UserInfoView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/16/25.
//

import SwiftUI

struct UserInfoView: View {
    var fullName: String = ""
    var redpin: String
    var userlocation: String
    var redpinSize: CGSize = .init(width: 20, height: 30)

    var body: some View {
        HStack(spacing: 8) { // minimal spacing; parent can add more if needed
            VStack(alignment: .leading, spacing: 4) {
                Text("Hello \(fullName) :)")
                    .font(.custom("DancingScript-Medium", size: 30))
                    .fontWeight(.medium)
                    .foregroundColor(.black)

                HStack(spacing: 4) {
                    Image(redpin)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: redpinSize.width, height: redpinSize.height)
//                        .border(.black)
                    Text(userlocation)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
//                        .border(.black)
                    Spacer()
                }
            }
            Spacer() // ensures content stays left-aligned
        }
    }
}

#Preview {
    UserInfoView(
        fullName: "Rishi",
        redpin: "redpin",
        userlocation: "Hyderabad, Telangana, India"
    )
}
