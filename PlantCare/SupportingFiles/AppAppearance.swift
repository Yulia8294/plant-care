//
//  AppAppearance.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

extension UIColor {
    
    static let accent = #colorLiteral(red: 0.3803921569, green: 0.6862745098, blue: 0.168627451, alpha: 1)
    static let secondaryText = #colorLiteral(red: 0.5490196078, green: 0.5490196078, blue: 0.5490196078, alpha: 1)
}

struct AppAppearance {
    
    static func setup() {
        setupTabBarAppearance()
    }
        
    private static func setupTabBarAppearance() {
        let tabBar = UITabBar.appearance()
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
      //  appearance.shadowImage = R.image.shadow()!
        appearance.backgroundColor = .white

        tabBar.tintColor = .accent
        tabBar.unselectedItemTintColor = .secondaryText
    }
}
