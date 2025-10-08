//
//  LogOutView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/19/25.
//
import SwiftUI

struct LogOutView: View {
    var body: some View {
        VStack {
            Text("Alert")
                .padding([.horizontal, .top], 10)
                .padding(.bottom, 0)
                .font(.largeTitle)
                .foregroundColor(.black)
//                .border(.black)
            Text("Are you sure you want to Logout?")
                .padding([.horizontal, .bottom], 10)
                .padding(.top, 0).font(.headline)
                .foregroundColor(.black)
            HStack(spacing: 15) {
                SaveButtonView(InvertedButton: true, buttonName: "Cancel")
                SaveButtonView(buttonName: "Logout")
            }
            .padding()
        }
        .padding([.horizontal, .vertical], 30)
        .background(.white)
        .cornerRadius(24)
//        .border(.black)
    }
}

#Preview {
    LogOutView()
}
