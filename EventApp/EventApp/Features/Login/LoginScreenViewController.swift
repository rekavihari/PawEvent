//
//  LoginScreenViewController.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 08..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginButton: RoundedWhiteButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        let preferences = UserDefaults.standard
        if(preferences.object(forKey: "sessions") != nil) {
            LoginDone()
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
        let session = URLSession.shared

        guard let url = urlstring else {
            return
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"

        let paramToSend = ["username":user,"password":psw]
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: paramToSend)

        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in

            guard let _:Data = data else {
                return
            }

            let json:Any?

            do {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            } catch { return }

            guard let server_response = json as? NSDictionary else {
                return
            }

            if let data_block = server_response["data"] as? NSDictionary {
                if let session_data = data_block["sessions"] as? String {
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")

                    DispatchQueue.main.async (
                        execute:self.LoginDone
                    )
                }
            }

        })
        task.resume()

    }

    func LoginToDo() {
        emailLabel.isEnabled = true
        passwordLabel.isEnabled = true

        loginButton.setTitle("Login", for: .normal)
    }

    func LoginDone() {
        emailLabel.isEnabled = false
        passwordLabel.isEnabled = false

    loginButton.setTitle("Logout", for: .normal)

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

}
