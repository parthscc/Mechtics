//
//  AppDelegate.swift
//  Mechtics
//
//  Created by PARTH on 05/02/22.
//

import UIKit
import CoreData
import SlideMenuControllerSwift

let themColor: UIColor = UIColor(red: 57/255, green: 186/255, blue: 232/255, alpha: 1)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sideview = storyboard.instantiateViewController(identifier: "SidemenuVC") as! SidemenuVC
        
        let SecondViewController = storyboard.instantiateViewController(identifier: "HomeNav") as! UINavigationController
        
        let slideMenuController = SlideMenuController(mainViewController: SecondViewController, leftMenuViewController: sideview)

        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = themColor
        
        let button = UIBarButtonItemAppearance()
        button.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.buttonAppearance = button
        
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        // Override point for customization after application launch.
        return true
    }

}

