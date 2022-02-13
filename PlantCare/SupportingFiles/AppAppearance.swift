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
    static var background = R.color.background()!
    static var backgroundDarker = R.color.backgroundDarker()!
    static var darkSecondAccent = R.color.darkSecondAccent()!
    static var lightAccent = R.color.lightAccent()!
    static var secondAccent = R.color.secondAccent()!
    static var secondAccentBackground = R.color.secondAccentBackground()!
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
        appearance.shadowColor = .accent
       
        tabBar.tintColor = R.color.accent()
        tabBar.unselectedItemTintColor = R.color.backgroundDarker()
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
    }
}
