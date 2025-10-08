//
//  UserAddAddressView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/19/25.
//
import SwiftUI

struct AddNewUserAddress: View {
    var body: some View {
        ZStack {
            LinearGradientView()
            VStack(spacing: 40) {
                VStack(alignment: .center) {
                    InputDataFieldView(placeholderText: "Name: e.g. Ordering for Someone else?")
                    InputDataFieldView(placeholderText: "House No / Flat No")
                    InputDataFieldView(placeholderText: "Society / Street Name")
                    InputDataFieldView(placeholderText: "Pincode")
                    //                InputDataFieldView(placeholderText: "State")
                    InputDataFieldView(placeholderText: "Mobile")
                    InputDataFieldView(placeholderText: "Instructions: e.g. Ring the Bell")
                }
//                Spacer()
                HStack(spacing: 12) {
                    SaveButtonView(buttonName: "Home")
                    SaveButtonView(buttonName: "Work")
                    SaveButtonView(buttonName: "Other")
                }
                SaveButtonView(
                    InvertedButton: true,
                    buttonName: "Save"
                )
            }
            .navigationTitle("ADD NEW ADDRESS")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddNewUserAddress()
}
