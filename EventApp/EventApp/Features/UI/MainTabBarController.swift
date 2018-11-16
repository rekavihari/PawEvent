//
//  MainTabBarController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false


        let navigationBarAppearace = UINavigationBar.appearance()

        navigationBarAppearace.clipsToBounds = false
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barTintColor = UIColor( red: CGFloat(217/255.0), green: CGFloat(242/255.0), blue: CGFloat(249/255.0), alpha: CGFloat(1.0) )
        navigationBarAppearace.shadowImage = nil
        navigationBarAppearace.tintColor = .black


        if isLoggedIn() {
            
        }
        else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "loginNaviVC")
            self.present(controller, animated: true, completion: nil)
        }

    }

    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
}
