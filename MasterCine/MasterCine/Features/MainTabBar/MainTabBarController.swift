//
//  MainTabBarController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 14/05/26.
//

import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        createNavController(
            viewController: HomeViewController(),
            title: "Home",
            imageName: "house"
        )
        
        createNavController(
            viewController: ProfileViewController(),
            title: "Perfil",
            imageName: "person"
        )
        
        customizeTabBarApperance()
    }
    
    private func customizeTabBarApperance() {
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundEffect = nil
        apperance.backgroundColor = DSColor.white
        apperance.shadowColor = .separator
        
        tabBar.standardAppearance = apperance
        tabBar.scrollEdgeAppearance = apperance
        tabBar.isTranslucent = false
        tabBar.tintColor = DSColor.red
        tabBar.unselectedItemTintColor = DSColor.greyNormal
    }
    
    private func createNavController(
        viewController: UIViewController,
        title: String,
        imageName: String
    ) {
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            selectedImage: UIImage(systemName: "\(imageName).fill")
        )
        
        viewControllers?.append(navController)
    }
}
