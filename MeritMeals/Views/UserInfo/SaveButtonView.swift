//
//  SaveButtonView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/19/25.
//
import SwiftUI

struct SaveButtonView: View {
    var InvertedButton: Bool = false
    var buttonName: String
    var body: some View {
        Button(buttonName) {
            print("Clicked on button")
        }
        .padding([.horizontal], 25)
        .padding([.vertical], 10)
        .font(.system(size: 20))
        .foregroundColor(InvertedButton ? .orange.opacity(0.7) : .white)
        .fontWeight(.heavy)
        .background(InvertedButton ? Color.orange.opacity(0.1) : Color.orange.opacity(0.7))
        .cornerRadius(50)
    }
}

#Preview {
    SaveButtonView(buttonName: "Save")
//    SaveButtonView(InvertedButton: true, buttonName: "Cancel")
}
