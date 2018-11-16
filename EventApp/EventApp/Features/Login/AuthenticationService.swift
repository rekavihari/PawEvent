//
//  AuthenticationService.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 09..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper
import Alamofire




final class AuthenticationService: NSObject {

    func Getdata(_ url: String, _ psw:String) {

        let urlstring = URL(string:"http://localhost:8080/api/events")

        guard let url = urlstring else {
            return
        }
        let parameters: Parameters = [
            "username": UserDefaults.standard.getUsername(),
            "password": UserDefaults.standard.getPassword()]
        let headers: HTTPHeaders = ["Authorization":UserDefaults.standard.getToken()]

        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isFailure {
                print("fail")
                print(response)
            }else {

                print(response)
            }
        }
    }
}
