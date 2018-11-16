//
//  SignupViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignupViewController: UIViewController, ErrorHandlerViewController {

    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signupButton: RoundedWhiteButton!

    override func viewDidLoad() {
        super.viewDidLoad()





    }

    @IBAction func signUpTapped(_ sender: Any) {
        guard let nameText = nameLabel.text else {return}
        guard let passText = passwordLabel.text else {return}
        guard let emailText = emailLabel.text else {return}
        DoSignUp(nameText,passText,emailText)
    }

    func DoSignUp(_ user: String, _ psw:String, _ email:String) {
        let urlstring = URL(string:"http://localhost:8080/api/register")
        let parameters: Parameters = [
            "login": user,
            "password": psw,
            "email": email
            ]
        guard let url = urlstring else {
            return
        }
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON
            { response in
                print(response)
                print("sikeres regisztráció")
                self.showAlert(title: "Sikeres regisztráció", message: "Kérjük, várd meg a jóváhagyást!")

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "loginVC")
                self.present(controller, animated: true, completion: nil)
                self.nameLabel.text = ""
                self.emailLabel.text = ""
                self.passwordLabel.text = ""


        }
    }



    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }



    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

  


}
