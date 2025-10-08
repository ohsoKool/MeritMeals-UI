//
//  UploadPictureView.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/19/25.
//
import SwiftUI

struct UploadPictureView: View {
    var defaultProfileImage: String = "userPlaceholder"
    var cameraIconOverlay: String = "camera"
    var body: some View {
        HStack(alignment: .center) {
            Image(defaultProfileImage)
                .resizable()
                .renderingMode(.original)
//                .foregroundColor(.gray.opacity(0.7))
                .aspectRatio(contentMode: .fit)
                .frame(height: 130)
                .overlay {
                    HStack(alignment: .bottom) {
                        Image(systemName: cameraIconOverlay)
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 30, alignment: .bottom)
                    }
                }
        }
    }
}

#Preview {
    UploadPictureView()
}
