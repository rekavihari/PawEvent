//
//  LoginViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func loginTapped(_ sender: Any) {

        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController

        mainTabController.selectedViewController = mainTabController.viewControllers?[0]

        present(mainTabController, animated: true, completion: nil)
    }
}
