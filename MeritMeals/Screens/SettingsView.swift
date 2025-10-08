//
//  SettingsView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/17/25.
//

import SwiftUI

struct SettingsView: View {
    let userProfile = ["Name : Rishi Kesh", "Mobile : 9835473528", "Theme : White", "Privacy Policy", "About"]
    var body: some View {
        ZStack {
            LinearGradientView()
            VStack(spacing: 0) {
                Spacer()
                UploadPictureView()
                Spacer()
                InputDataFieldView(placeholderText: "Name : e.g. John ")
                InputDataFieldView(placeholderText: "Email : e.g. john12@gmail.com")
                InputDataFieldView(placeholderText: "Mobile : e.g. 9397507371")
                    .keyboardType(.phonePad)
                Spacer()
                SaveButtonView(buttonName: "Save")
            }.navigationTitle("Edit Profile")
        }
    }
}

#Preview {
    SettingsView()
}
