//
//  GDPRViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 12. 03..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class GDPRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Vissza"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
}
