//
//  UserDefaults.swift
//  EventApp
//
//  Created by Reka Vihari on 2018. 11. 13..
//  Copyright © 2018. BME AUT. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKey: String {
        case isLoggedIn
        case username
        case password
        case accestoken
    }

    func setisLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKey.isLoggedIn.rawValue)
        synchronize()
    }

    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKey.isLoggedIn.rawValue)
    }

    func setUsername(value: String) {
        set(value, forKey: UserDefaultsKey.username.rawValue)
        synchronize()
    }

    func getUsername() -> String {
        guard let uname = UserDefaults.standard.string(forKey: "username") else { return "Nincs név"}
        return uname
    }

    func setPassword(value: String) {
        set(value, forKey: UserDefaultsKey.password.rawValue)
        synchronize()
    }

    func getPassword() -> String {
        guard let pwd = UserDefaults.standard.string(forKey: "password") else { return "Nincs jelszó"}
        return pwd
    }

    func setToken(value: String) {
        set(value, forKey: UserDefaultsKey.accestoken.rawValue)
        synchronize()
    }

    func getToken() -> String {
        guard let token = UserDefaults.standard.string(forKey: "accestoken") else { return "Nincs token"}
        return token
    }
}
