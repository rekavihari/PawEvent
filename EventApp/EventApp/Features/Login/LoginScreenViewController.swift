//
//  LoginScreenViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper

struct Auth: Decodable {
    let id_token: String

}

class LoginScreenViewController: UIViewController, ErrorHandlerViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginButton: RoundedWhiteButton!

    var token: String = "accestoken"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        let preferences = UserDefaults.standard
        if(preferences.object(forKey: "sessions") != nil) {
            isLoggedIn()
        } else {
            LoginToDo()
        }

    }

    @IBAction func loginTapped(_ sender: Any) {

        if(loginButton.titleLabel?.text == "Logout") {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            LoginToDo()
            return
        }

        let email = emailLabel.text
        let password = passwordLabel.text

        if (email == "" || password == "") {
            return
        }

        DoLogin(email!, password!)
    }

    func DoLogin(_ user: String, _ psw:String) {

        let urlstring = URL(string:"http://localhost:8080/api/authenticate")

        guard let url = urlstring else {
            return
        }
        let parameters: Parameters = [
            "username": user,
            "password": psw,
        ]
        var headers: HTTPHeaders = ["Authorization":"Bearer token"]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isFailure {
                print("fail")
                print(response)

            }else {

                let jsonData = response.data
                let decoder = JSONDecoder()

                guard let jsonString = jsonData else {
                    return
                }
                do {

                    let auth = try decoder.decode(Auth.self, from: jsonString)
                print("Bearer \(auth.id_token)")
                headers = ["Authorization":"Bearer \(auth.id_token)"]
                self.token=auth.id_token

                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = HTTPMethod.get.rawValue

                headers.updateValue("Bearer \(auth.id_token)", forKey: "Authorization")
                urlRequest.setValue("Bearer \(auth.id_token)", forHTTPHeaderField: "Authorization")

                UserDefaults.standard.setUsername(value: user)
                UserDefaults.standard.setPassword(value: psw)
                UserDefaults.standard.setToken(value: "Bearer \(auth.id_token)")
                        self.finishLoggingin()
                } catch {
                    print("nem sikerült a bejelentkezés")
                    self.showAlert(title: "Sikertelen bejelentkezés", message: "Rossz felhasználónév vagy jelszó!")
                }

                if self.isLoggedIn() {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
                    self.present(controller, animated: true, completion: nil)


                }
                else {
                    print("nem sikerült a bejelentkezés")
                    self.showAlert(title: "Sikertelen bejelentkezés", message: "Rossz felhasználónév vagy jelszó!")
                }

            }
        }

    }

    func LoginToDo()  {
        emailLabel.isEnabled = true
        passwordLabel.isEnabled = true

        loginButton.setTitle("Bejelentkezés", for: .normal)
    }

    func isLoggedIn() -> Bool {


        
        return UserDefaults.standard.isLoggedIn()

    }

    func finishLoggingin() {
        UserDefaults.standard.setisLoggedIn(value: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailLabel {
            passwordLabel.becomeFirstResponder()
        } else if textField == passwordLabel {
            textField.resignFirstResponder()
        }
        return true
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }


}
