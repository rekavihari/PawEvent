//
//  ErrorHandlerViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 13..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

protocol ErrorHandlerViewController {

    func showAlert(title: String, message:String)

}

extension ErrorHandlerViewController where Self: UIViewController {

    func showAlert(title: String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK!", style: .default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }



}
