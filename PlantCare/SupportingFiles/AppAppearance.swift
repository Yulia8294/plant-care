//
//  AppAppearance.swift
//  PlantCare
//
//  Created by Yulia Novikova on 1/8/22.
//

import UIKit

extension UIColor {
    
    static var accent = R.color.accent()!
    static var primaryText = R.color.primaryText()!
    static var secondaryText = R.color.secondaryText()!
}

struct AppAppearance {
    
    static func setup() {
        setupTabBarAppearance()
        setupNavBarAppearance()
    }
    
    private static func setupNavBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        
        appearance.setBackIndicatorImage(R.image.back()!.withTintColor(.primaryText), transitionMaskImage: R.image.back()!.withTintColor(.primaryText))
        //appearance.backgroundImage = UIImage.init(color: .white)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.primaryText,
                                          .font: UIFont.systemFont(ofSize: 15, weight: .semibold)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.accent,
                                               .font: UIFont.systemFont(ofSize: 25, weight: .semibold),
                                               .kern: 0.41]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
        
    private static func setupTabBarAppearance() {
        let tabBar = UITabBar.appearance()
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
      //  appearance.shadowImage = R.image.shadow()!
        appearance.backgroundColor = .white

        tabBar.tintColor = R.color.accent()
        tabBar.unselectedItemTintColor = R.color.backgroundDarker()
    }
}
