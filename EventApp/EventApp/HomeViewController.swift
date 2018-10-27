//
//  HomeViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 10. 04..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            // Hide the navigation bar on the this view controller
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }

    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            // Show the navigation bar on other view controllers
            self.navigationController?.setNavigationBarHidden(false, animated: animated)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
