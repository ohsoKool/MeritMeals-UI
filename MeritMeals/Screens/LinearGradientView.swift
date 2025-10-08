//
//  LinearGradient.swift
//  UniEatsPage
//
//  Created by Rishikesh Gunda on 9/17/25.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        LinearGradient(colors: [.white, .orange.opacity(0.5)], startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()
    }
}
