//
//  MeritMealsApp.swift
//  MeritMeals
//
//  Created by Rishikesh Gunda on 10/8/25.
//

import SwiftUI

@main
struct MeritMealsApp: App {
    init() {
        print("The Application has started!")
        UIView.appearance().overrideUserInterfaceStyle = .light
    }

    var body: some Scene {
        WindowGroup {
            LandingPageView()
        }
    }
}
